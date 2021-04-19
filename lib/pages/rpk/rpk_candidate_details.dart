import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:jpj_qto/common_library/services/repository/auth_repository.dart';
import 'package:jpj_qto/common_library/services/repository/epandu_repository.dart';
import 'package:jpj_qto/common_library/utils/custom_button.dart';
import 'package:jpj_qto/common_library/utils/custom_dialog.dart';
import 'package:jpj_qto/common_library/utils/loading_model.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../router.gr.dart';

class RpkCandidateDetails extends StatefulWidget {
  @override
  _RpkCandidateDetailsState createState() => _RpkCandidateDetailsState();
}

class _RpkCandidateDetailsState extends State<RpkCandidateDetails> {
  String barcode = "";
  final primaryColor = ColorConstant.primaryColor;
  final myImage = ImagesConstant();
  final authRepo = AuthRepo();
  final epanduRepo = EpanduRepo();
  final customDialog = CustomDialog();
  final textStyle = TextStyle(
    fontSize: 80.sp,
    color: Colors.black,
  );

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController qrController;
  bool iconVisible = true;
  bool isVisible = false;
  bool nextVis = false;
  bool isLoading = false;

  var result;
  String qNo = '';
  String nric = '';
  String name = '';
  String testDate = '';
  String groupId = '';
  String testCode = '';
  String vehNo = '';

  Future<void> callPart3JpjTest() async {
    setState(() {
      isLoading = true;
    });

    var result = await epanduRepo.callPart3JpjTest(
      vehNo: vehNo,
      part3Type: 'RPK',
      groupId: groupId,
      testCode: testCode,
      icNo: nric,
    );

    if (result.isSuccess) {
      setState(() {
        result = result.data;
      });

      ExtendedNavigator.of(context).push(Routes.rpkPartIII,
          arguments: RpkPartIIIArguments(
            qNo: qNo,
            nric: nric,
            name: name,
            testDate: testDate,
            groupId: groupId,
            testCode: testCode,
            vehNo: vehNo,
          ));
    } else {
      customDialog.show(
          context: context,
          content: 'Gagal mendapatkan rekod pelajar.',
          type: DialogType.WARNING);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController qrController) {
    setState(() {
      this.qrController = qrController;
    });
    qrController.scannedDataStream.listen((scanData) {
      setState(() {
        qNo = jsonDecode(scanData.code)['Table1'][0]['queue_no'];
        nric = jsonDecode(scanData.code)['Table1'][0]['nric_no'];
        name = jsonDecode(scanData.code)['Table1'][0]['fullname'];
        testDate = jsonDecode(scanData.code)['Table1'][0]['test_date'];
        groupId = jsonDecode(scanData.code)['Table1'][0]['group_id'];
        testCode = jsonDecode(scanData.code)['Table1'][0]['test_code'];
        vehNo = jsonDecode(scanData.code)['Table1'][0]['veh_no'];
        nextVis = true;
        iconVisible = true;
        isVisible = false;
      });
    });
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calling'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    Text(
                      qNo.isNotEmpty ? qNo : 'Q-NO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 250.sp),
                    ),
                    SizedBox(height: 50.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 150.w),
                      child: Table(
                        // border: TableBorder.all(),
                        columnWidths: {0: FractionColumnWidth(.30)},
                        children: [
                          /* TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text('Q-NO',
                                  textAlign: TextAlign.center, style: textStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(qNo, style: textStyle),
                            ),
                          ],
                        ), */
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text('NRIC', style: textStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(nric, style: textStyle),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text('NAMA', style: textStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(name, style: textStyle),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: isVisible,
                  child: Expanded(flex: 2, child: _buildQrView(context))),
              Visibility(
                visible: iconVisible,
                child: Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = true;
                        iconVisible = false;
                      });
                    },
                    iconSize: 150,
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
              ),
              Visibility(
                visible: nextVis,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      onPressed: () => ExtendedNavigator.of(context).pop(),
                      buttonColor: Color(0xffdd0e0e),
                      title: 'Cancel',
                    ),
                    CustomButton(
                      onPressed: callPart3JpjTest,
                      buttonColor: Color(0xffdd0e0e),
                      title: 'Next',
                    ),
                  ],
                ),
              ),
            ],
          ),
          LoadingModel(
            isVisible: isLoading,
          ),
        ],
      ),
    );
  }
}
