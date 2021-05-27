import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:jpj_qto/common_library/services/repository/auth_repository.dart';
import 'package:jpj_qto/common_library/services/repository/epandu_repository.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/common_library/utils/custom_dialog.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../router.gr.dart';

class JrCandidateDetails extends StatefulWidget {
  @override
  _JrCandidateDetailsState createState() => _JrCandidateDetailsState();
}

class _JrCandidateDetailsState extends State<JrCandidateDetails> {
  final localStorage = LocalStorage();
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

  String qNo = '';
  String nric = '';
  String name = '';
  String testDate = '';
  String groupId = '';
  String testCode = '';
  String vehNo = '';
  String merchantNo = '';

  List<dynamic> candidateList = [];
  var selectedCandidate;

  @override
  void initState() {
    super.initState();

    getPart3AvailableToCallJpjTestList();
  }

  getPart3AvailableToCallJpjTestList() async {
    String vehNo = await localStorage.getPlateNo();

    var result = await epanduRepo.getPart3AvailableToCallJpjTestList(
        part3Type: 'RPK + JALAN RAYA', vehNo: vehNo);

    if (result.isSuccess) {
      setState(() {
        candidateList = result.data;
      });
    }
  }

  getSelectedCandidateInfo(queueNo) {
    for (int i = 0; i < candidateList.length; i += 1) {
      if (candidateList[i].queueNo == queueNo) {
        selectedCandidate = candidateList[i];

        setState(() {
          nric = candidateList[i].nricNo;
          name = candidateList[i].fullname;
        });

        break;
      }
    }
  }

  compareCandidateInfo() {
    // var merchantNo = selectedCandidate.merchantNo;
    var testCode = selectedCandidate.testCode;
    var groupId = selectedCandidate.groupId;
    var testDate = selectedCandidate.testDate;

    if (this.merchantNo == merchantNo &&
        this.testCode == testCode &&
        this.groupId == groupId) {
      ExtendedNavigator.of(context).push(
        Routes.confirmCandidateInfo,
        arguments: ConfirmCandidateInfoArguments(
          part3Type: 'RPK + JALAN RAYA',
          nric: nric,
          name: name,
          qNo: qNo,
          groupId: groupId,
          testDate: testDate,
          testCode: testCode,
        ),
      );
    } else {
      customDialog.show(
        barrierDismissable: true,
        context: context,
        content: AppLocalizations.of(context).translate('record_not_matched'),
        customActions: <Widget>[
          FlatButton(
            child: Text(AppLocalizations.of(context).translate('yes_lbl')),
            onPressed: () => ExtendedNavigator.of(context).push(
              Routes.confirmCandidateInfo,
              arguments: ConfirmCandidateInfoArguments(
                part3Type: 'RPK + JALAN RAYA',
                nric: nric,
                name: name,
                qNo: qNo,
                groupId: groupId,
                testDate: testDate,
                testCode: testCode,
              ),
            ),
          ),
          FlatButton(
            child: Text(AppLocalizations.of(context).translate('no_lbl')),
            onPressed: () => ExtendedNavigator.of(context).pop(),
          ),
        ],
        type: DialogType.GENERAL,
      );
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid && isVisible) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
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
    qrController.scannedDataStream.listen((scanData) async {
      await qrController?.pauseCamera();

      setState(() {
        merchantNo = jsonDecode(scanData.code)['Table1'][0]['merchant_no'];
        testCode = jsonDecode(scanData.code)['Table1'][0]['test_code'];
        groupId = jsonDecode(scanData.code)['Table1'][0]['group_id'];
        iconVisible = true;
        isVisible = false;
      });

      compareCandidateInfo();

      // await qrController.resumeCamera();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Container(
                  width: 1300.h,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 50.w),
                      labelText: 'Q-NO',
                      labelStyle: TextStyle(
                        fontSize: 80.sp,
                      ),
                      // fillColor: Colors.grey.withOpacity(.25),
                      // filled: true,
                      // prefixIcon: Icon(Icons.edit),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    items: candidateList != null
                        ? candidateList
                            .map<DropdownMenuItem<String>>((dynamic value) {
                            return DropdownMenuItem<String>(
                              value: value.queueNo,
                              child: Center(child: Text(value.queueNo)),
                            );
                          }).toList()
                        : null,
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    onChanged: (String newValue) {
                      setState(() {
                        qNo = newValue;
                      });

                      getSelectedCandidateInfo(newValue);
                    },
                  ),
                ),
                // Text(
                //   qNo.isNotEmpty ? qNo : 'Q-NO',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold, fontSize: 250.sp),
                // ),
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
        ],
      ),
    );
  }
}
