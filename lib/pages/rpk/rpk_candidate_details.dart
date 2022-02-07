import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:jpj_qto/common_library/services/repository/auth_repository.dart';
import 'package:jpj_qto/common_library/services/repository/epandu_repository.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/common_library/utils/custom_button.dart';
import 'package:jpj_qto/common_library/utils/custom_dialog.dart';
import 'package:jpj_qto/common_library/utils/loading_model.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../router.gr.dart';

class RpkCandidateDetails extends StatefulWidget {
  @override
  _RpkCandidateDetailsState createState() => _RpkCandidateDetailsState();
}

class _RpkCandidateDetailsState extends State<RpkCandidateDetails> {
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
  QRViewController? qrController;
  bool iconVisible = true;
  bool isVisible = false;

  String? qNo = '';
  String? nric = '';
  String? name = '';
  String testDate = '';
  String? groupId = '';
  String? testCode = '';
  String? vehNo = '';
  String? merchantNo = '';

  List<dynamic>? candidateList = [];
  var selectedCandidate;

  bool isLoading = false;
  int success = 0;

  @override
  void initState() {
    super.initState();

    getPart3AvailableToCallJpjTestList();
  }

  getPart3AvailableToCallJpjTestList() async {
    setState(() {
      isLoading = true;
    });

    String? vehNo = await localStorage.getPlateNo();

    var result =
        await epanduRepo.getRpkAvailableToCallJpjTestList(vehNo: vehNo);

    if (result.isSuccess) {
      setState(() {
        candidateList = result.data;
      });
    } else {
      if (mounted) {
        customDialog.show(
          context: context,
          // content: AppLocalizations.of(context).translate('no_candidate'),
          content: result.message,
          type: DialogType.INFO,
        );
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  getSelectedCandidateInfo(queueNo) {
    for (int i = 0; i < candidateList!.length; i += 1) {
      if (candidateList![i].queueNo == queueNo) {
        selectedCandidate = candidateList![i];

        setState(() {
          nric = candidateList![i].nricNo;
          name = candidateList![i].fullname;
        });

        break;
      }
    }
  }

  compareCandidateInfo() async {
    // var merchantNo = selectedCandidate.merchantNo;
    var testCode = selectedCandidate.testCode;
    var groupId = selectedCandidate.groupId;
    var testDate = selectedCandidate.testDate;

    if (this.groupId == groupId) {
      if (this.testCode == testCode) {
        if (success == 0) {
          // await callPart3JpjTest();
        }

        context.router
            .push(
          ConfirmCandidateInfo(
            part3Type: 'RPK',
            nric: this.nric,
            candidateName: this.name,
            qNo: this.qNo,
            groupId: this.groupId,
            testDate: testDate,
            testCode: this.testCode,
          ),
        )
            .then((value) {
          // cancelCallPart3JpjTest();
        });
      } else {
        for (int i = 0; i < candidateList!.length; i += 1) {
          if (candidateList![i].testCode == this.testCode) {
            customDialog.show(
              barrierDismissable: true,
              context: context,
              content:
                  AppLocalizations.of(context)!.translate('record_not_matched'),
              customActions: <Widget>[
                TextButton(
                  child:
                      Text(AppLocalizations.of(context)!.translate('yes_lbl')),
                  onPressed: () async {
                    context.router.pop();

                    setState(() {
                      this.name = candidateList![i].fullname;
                      this.qNo = candidateList![i].queueNo;
                    });

                    if (success > 0)
                      Future.wait([
                        cancelCallPart3JpjTest(),
                        callPart3JpjTest(type: 'SKIP'),
                      ]);
                    else
                      await callPart3JpjTest(type: 'SKIP');

                    context.router
                        .push(
                      ConfirmCandidateInfo(
                        part3Type: 'RPK',
                        nric: this.nric,
                        candidateName: this.name,
                        qNo: this.qNo,
                        groupId: this.groupId,
                        testDate: testDate,
                        testCode: this.testCode,
                      ),
                    )
                        .then((value) {
                      cancelCallPart3JpjTest(type: 'SKIP');
                    });

                    // cancelCallPart3JpjTest();

                    // callPart3JpjTest();
                  },
                ),
                TextButton(
                  child:
                      Text(AppLocalizations.of(context)!.translate('no_lbl')),
                  onPressed: () => context.router.pop(),
                ),
              ],
              type: DialogType.GENERAL,
            );

            break;
          } else if (i + 1 == candidateList!.length) {
            customDialog.show(
              context: context,
              content: AppLocalizations.of(context)!
                  .translate('qr_candidate_not_found'),
              type: DialogType.INFO,
            );
          }
        }
      }
    } else {
      customDialog.show(
        barrierDismissable: true,
        context: context,
        content: AppLocalizations.of(context)!
            .translate('record_not_matched_reject'),
        type: DialogType.WARNING,
      );
    }
  }

  Future<void> callPart3JpjTest({type}) async {
    var testCode = selectedCandidate.testCode;
    var groupId = selectedCandidate.groupId;
    // var testDate = selectedCandidate.testDate;

    setState(() {
      isLoading = true;
    });

    vehNo = await localStorage.getPlateNo();

    var result = await epanduRepo.callRpkJpjTest(
      vehNo: vehNo,
      part3Type: 'JALAN RAYA',
      groupId: type == 'SKIP' ? this.groupId : groupId,
      testCode: type == 'SKIP' ? this.testCode : testCode,
      icNo: nric,
    );

    if (result.isSuccess) {
      success += 1;

      if (type == 'MANUAL') {
        customDialog.show(
          context: context,
          content: AppLocalizations.of(context)!.translate('call_successful'),
          type: DialogType.SUCCESS,
        );
      }
    } else {
      customDialog.show(
        context: context,
        barrierDismissable: false,
        content: result.message,
        onPressed: () {
          context.router
              .pop()
              .then((value) => getPart3AvailableToCallJpjTestList());
        },
        type: DialogType.INFO,
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> cancelCallPart3JpjTest({type}) async {
    var testCode = selectedCandidate.testCode;
    var groupId = selectedCandidate.groupId;

    setState(() {
      isLoading = true;
    });

    var result = await epanduRepo.cancelCallRpkJpjTest(
      part3Type: 'JALAN RAYA',
      groupId: type == 'SKIP' ? this.groupId : groupId,
      testCode: type == 'SKIP' ? this.testCode : testCode,
      icNo: nric,
    );

    if (result.isSuccess) {
      // context.router.pop();
      if (type == 'MANUAL') {
        customDialog.show(
          context: context,
          content: AppLocalizations.of(context)!.translate('call_cancelled'),
          type: DialogType.SUCCESS,
        );
      }

      setState(() {
        success = 0;
        candidateList!.clear();
        selectedCandidate = null;

        if (type != 'HOME') getPart3AvailableToCallJpjTestList();
      });
    } else {
      if (mounted) {
        customDialog.show(
          context: context,
          content: result.message,
          type: DialogType.WARNING,
        );
      }
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
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
        ? 300.0
        : 400.0;
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
      await qrController.pauseCamera();

      setState(() {
        try {
          merchantNo = jsonDecode(scanData.code!)['Table1'][0]['merchant_no'];
          testCode = jsonDecode(scanData.code!)['Table1'][0]['test_code'];
          groupId = jsonDecode(scanData.code!)['Table1'][0]['group_id'];
          nric = jsonDecode(scanData.code!)['Table1'][0]['nric_no'];
          iconVisible = true;
          isVisible = false;

          if (qNo!.isNotEmpty) {
            compareCandidateInfo();
          } else {
            nric = '';

            customDialog.show(
              barrierDismissable: true,
              context: context,
              content: AppLocalizations.of(context)!.translate('scan_again'),
              type: DialogType.INFO,
            );
          }
        } catch (e) {
          customDialog.show(
            barrierDismissable: true,
            context: context,
            content: AppLocalizations.of(context)!.translate('invalid_qr'),
            customActions: [
              TextButton(
                onPressed: () {
                  context.router.pop();

                  qrController.resumeCamera();
                },
                child: Text('Ok'),
              ),
            ],
            type: DialogType.GENERAL,
          );
        }
      });

      // await qrController.resumeCamera();
    });
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (success > 0) {
      return CustomDialog().show(
        context: context,
        title: Text(AppLocalizations.of(context)!.translate('warning_title')),
        content: AppLocalizations.of(context)!.translate('confirm_exit_desc'),
        customActions: <Widget>[
          TextButton(
            child: Text(AppLocalizations.of(context)!.translate('yes_lbl')),
            onPressed: () async {
              await cancelCallPart3JpjTest(type: 'HOME');
            },
          ),
          TextButton(
            child: Text(AppLocalizations.of(context)!.translate('no_lbl')),
            onPressed: () {
              context.router.pop();
            },
          ),
        ],
        type: DialogType.GENERAL,
      );
    }
    // context.router.pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calling'),
          actions: [
            IconButton(
              onPressed: () {
                customDialog.show(
                  context: context,
                  content: AppLocalizations.of(context)!
                      .translate('select_queue_tooltip'),
                  type: DialogType.INFO,
                );
              },
              icon: Icon(Icons.info_outline),
              tooltip: AppLocalizations.of(context)!
                  .translate('select_queue_tooltip'),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    SizedBox(height: 50.h),
                    Container(
                      width: 1300.h,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 50.w),
                          labelText: 'Q-NO',
                          labelStyle: TextStyle(
                              // fontSize: 80.sp,
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
                            ? candidateList!
                                .map<DropdownMenuItem<String>>((dynamic value) {
                                return DropdownMenuItem<String>(
                                  value: value.queueNo,
                                  child: Center(
                                      child: Text(
                                    value.queueNo,
                                    style: TextStyle(
                                        // fontSize: 80.sp,
                                        ),
                                  )),
                                );
                              }).toList()
                            : null,
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);

                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        onChanged: (String? newValue) {
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
                              child: Text(nric!, style: textStyle),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text('NAMA', style: textStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(name!, style: textStyle),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            CustomButton(
                              onPressed: () {
                                if (selectedCandidate != null)
                                  callPart3JpjTest(type: 'MANUAL');
                                else
                                  customDialog.show(
                                    context: context,
                                    content: AppLocalizations.of(context)!
                                        .translate('select_queue_no'),
                                    type: DialogType.INFO,
                                  );
                              },
                              buttonColor: Color(0xffdd0e0e),
                              title: AppLocalizations.of(context)!
                                  .translate('call_btn'),
                            ),
                            IconButton(
                              onPressed: () {
                                customDialog.show(
                                  context: context,
                                  content: AppLocalizations.of(context)!
                                      .translate('call_tooltip'),
                                  type: DialogType.INFO,
                                );
                              },
                              icon: Icon(Icons.info_outline),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomButton(
                              // onPressed: () =>
                              //     cancelCallPart3JpjTest(type: 'MANUAL'),
                              onPressed: () {
                                if (selectedCandidate != null) {
                                  CustomDialog().show(
                                    context: context,
                                    title: Text(AppLocalizations.of(context)!
                                        .translate('warning_title')),
                                    content: AppLocalizations.of(context)!
                                        .translate('confirm_cancel_desc'),
                                    customActions: <Widget>[
                                      TextButton(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .translate('yes_lbl')),
                                        onPressed: () {
                                          context.router.pop();
                                          cancelCallPart3JpjTest(
                                              type: 'MANUAL');
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .translate('no_lbl')),
                                        onPressed: () {
                                          context.router.pop();
                                        },
                                      ),
                                    ],
                                    type: DialogType.GENERAL,
                                  );
                                } else
                                  customDialog.show(
                                    context: context,
                                    content: AppLocalizations.of(context)!
                                        .translate('select_queue_no'),
                                    type: DialogType.INFO,
                                  );
                              },
                              buttonColor: Color(0xffdd0e0e),
                              title: AppLocalizations.of(context)!
                                  .translate('cancel_btn'),
                            ),
                            IconButton(
                              onPressed: () {
                                customDialog.show(
                                  context: context,
                                  content: AppLocalizations.of(context)!
                                      .translate('cancel_tooltip'),
                                  type: DialogType.INFO,
                                );
                              },
                              icon: Icon(Icons.info_outline),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Visibility(
                    visible: isVisible,
                    child: Expanded(child: _buildQrView(context))),
                Visibility(
                  visible: iconVisible,
                  child: Expanded(
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
            LoadingModel(
              isVisible: isLoading,
              color: ColorConstant.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
