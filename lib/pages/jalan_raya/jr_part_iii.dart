import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpj_qto/common_library/services/model/provider_model.dart';
import 'package:jpj_qto/common_library/services/repository/epandu_repository.dart';
import 'package:jpj_qto/common_library/services/repository/etesting_repository.dart';
import 'package:jpj_qto/common_library/utils/custom_dialog.dart';
import 'package:jpj_qto/common_library/utils/loading_model.dart';
import 'package:jpj_qto/component/profile.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../router.gr.dart';

// ignore: must_be_immutable
@RoutePage(name: 'JrPartIII')
class JrPartIII extends StatefulWidget {
  final String? qNo;
  final String? nric;
  final String? jrName;
  final String? testDate;
  final String? groupId;
  final String? testCode;
  final String? vehNo;
  final bool skipUpdateJrJpjTestStart;

  const JrPartIII(this.qNo, this.nric, this.jrName, this.testDate, this.groupId,
      this.testCode, this.vehNo, this.skipUpdateJrJpjTestStart,
      {super.key});

  @override
  _JrPartIIIState createState() => _JrPartIIIState();
}

class _JrPartIIIState extends State<JrPartIII> {
  final image = ImagesConstant();
  final localStorage = LocalStorage();
  final epanduRepo = EpanduRepo();
  final customDialog = CustomDialog();
  bool isVisible = false;
  // int success = 0;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isButtonEnabled = true;

  bool checkAll = false;
  bool checkAllB = false;
  Future? ruleFuture;
  final etestingRepo = EtestingRepo();
  var ruleList = [];
  var ruleJson = {
    'a': [],
    'b': [],
    'c': [],
    'd': [],
    'e': [],
    'f': [],
    'g': [],
    'h': [],
    'i': [],
  };

  @override
  void initState() {
    super.initState();

    checkWifiStatus();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    getRule();
    if (!widget.skipUpdateJrJpjTestStart) {
      updatePart3JpjTestStart();
    }
  }

  Future<void> checkWifiStatus() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      // Update the button state based on connectivity status
      isButtonEnabled = _connectionStatus == ConnectivityResult.wifi;
    });
  }

  void getRule() async {
    ruleFuture = etestingRepo.getRule(elementCode: 'PART3');
    var result = await ruleFuture;
    setState(() {
      ruleList = result.data;
      for (var element in ruleList) {
        element.isCheck = true;
      }
    });
    ruleJson = {};

    for (var i = 0; i < ruleList.length; i++) {
      if (ruleJson[ruleList[i].ruleCode[0]] == null) {
        ruleJson[ruleList[i].ruleCode[0]] = [];
      }
      ruleJson[ruleList[i].ruleCode[0]]!.add(ruleList[i]);
    }
    print(ruleJson);
  }

  Future<void> updatePart3JpjTestStart() async {
    setState(() {
      isVisible = true;
    });

    var result = await epanduRepo.updatePart3JpjTestStart(
      groupId: widget.groupId,
      icNo: widget.nric,
      part3Type: 'JALAN RAYA',
      testCode: widget.testCode,
    );

    if (result.isSuccess) {
    } else {
      customDialog.show(
          context: context,
          title: const Icon(Icons.error_outline),
          content: result.message,
          customActions: [
            TextButton(
              onPressed: () => context.router.popUntil(
                ModalRoute.withName('ConfirmCandidateInfo'),
              ),
              child: const Text('Ok'),
            ),
          ],
          type: DialogType.GENERAL);
    }

    setState(() {
      isVisible = false;
    });
  }

  Future<void> updatePart3JpjTestResult(part3Type) async {
    var a = {
      'Result': [{}]
    };
    bool isUntickMandatory = false;

    for (var element in ruleList) {
      if (element.mandatory == 'true' &&
          (element.isCheck == null ||
              element.isCheck == 'false' ||
              !element.isCheck)) {
        isUntickMandatory = true;
      }
      a['Result']![0][element.ruleCode] =
          element.isCheck == null || element.isCheck == false ? 0 : '1';
    }
    bool canContinue = false;
    if (isUntickMandatory) {
      canContinue = await showDialog(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('JPJ QTO APP'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Calon Ini Telah Gagal Kerana Kesalahan Mandatori.'),
                  Text('Adakah Anda Pasti?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.translate('cancel_btn'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.translate('ok_btn'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );

      if (!canContinue) {
        return;
      }
    }
    print(jsonEncode(a));

    setState(() {
      isVisible = true;
    });

    int score = 0;
    for (var element in ruleList) {
      if (element.mandatory == 'false' && element.isCheck) {
        score += 1;
      }
    }

    if (score < 64) {
      canContinue = await showDialog(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('JPJ QTO APP'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Calon Gagal Kerana Markah Kurang Dari 80%. Ujian Akan Ditamatkan.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.translate('go_back_lbl'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.translate('ok_btn'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    } else {
      canContinue = true;
    }

    if (!canContinue) {
      setState(() {
        isVisible = false;
      });
      return;
    }

    var result = await epanduRepo.updatePart3JpjTestResult(
      vehNo: widget.vehNo,
      resultJson: jsonEncode(a),
      testCode: widget.testCode,
      groupId: widget.groupId,
      icNo: widget.nric,
      part3Type: part3Type,
    );

    if (result.isSuccess) {
      customDialog.show(
        context: context,
        barrierDismissable: false,
        onPressed: () {
          Provider.of<JrSessionModel>(context, listen: false).reset();

          context.router.pushAndPopUntil(const Home(), predicate: (r) => false);
        },
        content: AppLocalizations.of(context)!.translate('test_submitted'),
        type: DialogType.SUCCESS,
      );
    } else {
      customDialog.show(
        context: context,
        content: result.message,
        type: DialogType.WARNING,
      );
    }

    setState(() {
      isVisible = false;
    });
  }

  Future<bool> _onWillPop() async {
    // return CustomDialog().show(
    //   context: context,
    //   title: Text(AppLocalizations.of(context).translate('warning_title')),
    //   content: AppLocalizations.of(context).translate('confirm_exit_desc'),
    //   customActions: <Widget>[
    //     TextButton(
    //       child: Text(AppLocalizations.of(context).translate('yes_lbl')),
    //       onPressed: () {
    //         Provider.of<JrSessionModel>(context, listen: false).reset();

    //         context.router.popUntil(
    //           ModalRoute.withName(Routes.home),
    //         );
    //       },
    //     ),
    //     TextButton(
    //       child: Text(AppLocalizations.of(context).translate('no_lbl')),
    //       onPressed: () {
    //         context.router.pop();
    //       },
    //     ),
    //   ],
    //   type: DialogType.GENERAL,
    // );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // int rpkMark = context.watch<JrSessionModel>().rpkMark;
    int aMark = context.watch<JrSessionModel>().aMark;
    int aMandatoryMark = context.watch<JrSessionModel>().aMandatoryMark;
    int bMark = context.watch<JrSessionModel>().bMark;
    int bMandatoryMark = context.watch<JrSessionModel>().bMandatoryMark;
    int cMark = context.watch<JrSessionModel>().cMark;
    int cMandatoryMark = context.watch<JrSessionModel>().cMandatoryMark;
    int dMark = context.watch<JrSessionModel>().dMark;
    int dMandatoryMark = context.watch<JrSessionModel>().dMandatoryMark;
    int eMark = context.watch<JrSessionModel>().eMark;
    int eMandatoryMark = context.watch<JrSessionModel>().eMandatoryMark;
    int fMark = context.watch<JrSessionModel>().fMark;
    int fMandatoryMark = context.watch<JrSessionModel>().fMandatoryMark;
    int gMark = context.watch<JrSessionModel>().gMark;
    int gMandatoryMark = context.watch<JrSessionModel>().gMandatoryMark;
    int hMark = context.watch<JrSessionModel>().hMark;
    int hMandatoryMark = context.watch<JrSessionModel>().hMandatoryMark;
    int iMandatoryMark = context.watch<JrSessionModel>().iMandatoryMark;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jalan Raya'),
          automaticallyImplyLeading: false,
          actions: const [
            // IconButton(
            //   onPressed: () {
            //     setState(() {
            //       getRule();
            //     });
            //   },
            //   icon: Icon(Icons.abc_outlined),
            // ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // _header(),
                  //RpkSessionA(),
                  /* Padding(
                    padding: const EdgeInsets.only(bottom: 1, top: 2),
                    child: SessionR(),
                  ), */
                  FutureBuilder(
                    future: ruleFuture,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        default:
                          if (snapshot.hasData) {
                            if (snapshot.data.isSuccess) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ProfileWidget(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Nama: ${widget.jrName ?? ''}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      'Tandakan ✖️ Untuk Demerit',
                                      style: TextStyle(
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 1, top: 2),
                                    child: expandableList(
                                        code: 'a', numberRank: 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1),
                                    child: expandableList(
                                        code: 'b', numberRank: 2),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1),
                                    child: expandableList(
                                        code: 'c', numberRank: 3),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1),
                                    child: expandableList(
                                        code: 'd', numberRank: 4),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1),
                                    child: expandableList(
                                        code: 'e', numberRank: 5),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1),
                                    child: expandableList(
                                        code: 'f', numberRank: 6),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1),
                                    child: expandableList(
                                        code: 'g', numberRank: 7),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1),
                                    child: expandableList(
                                        code: 'h', numberRank: 8),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1),
                                    child: expandableList(
                                        code: 'i', numberRank: 9),
                                  ),
                                ],
                              );
                            } else {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                      size: 60,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Text(
                                          'Error: ${snapshot.data.message}'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Text('Error: ${snapshot.error}'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                      }
                    },
                  ),

                  SizedBox(
                    height: ScreenUtil().setHeight(100),
                  ),

                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('session_lbl'),
                                style: const TextStyle(color: Colors.black))),
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('normal_mistake_mark'),
                                style: const TextStyle(color: Colors.black))),
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('mandatory_mistake_mark'),
                                style: const TextStyle(color: Colors.black))),
                      ]),
                      /* TableRow(children: [
                        Center(
                            child: Text('R',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$rpkMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/24',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: Text('-',
                                style: TextStyle(color: Colors.black))),
                      ]), */
                      TableRow(children: [
                        const Center(
                            child: Text('A',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['a']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'false')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/19',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['a']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'true')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/1',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        const Center(
                            child: Text('B',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['b']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'false')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/7',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['b']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'true')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/3',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        const Center(
                            child: Text('C',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['c']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'false')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/12',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['c']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'true')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/6',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        const Center(
                            child: Text('D',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['d']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'false')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/13',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['d']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'true')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/7',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        const Center(
                            child: Text('E',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['e']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'false')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/8',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['e']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'true')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/6',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        const Center(
                            child: Text('F',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['f']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'false')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/7',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['f']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'true')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/3',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        const Center(
                            child: Text('G',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['g']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'false')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/8',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['g']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'true')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/4',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        const Center(
                            child: Text('H',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['h']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'false')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/6',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['h']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'true')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/4',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        const Center(
                            child: Text('I',
                                style: TextStyle(color: Colors.black))),
                        const Center(
                            child: Text('-',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: ruleJson['i']!
                                        .where((c) =>
                                            c.isCheck == true &&
                                            c.mandatory == 'true')
                                        .length
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                    children: const <TextSpan>[
                              TextSpan(
                                  text: '/8',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  totalScore(),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Future.wait([
                        //   updatePart3JpjTestResult('RPK'),
                        //   updatePart3JpjTestResult('JALAN RAYA'),
                        // ]);
                        isButtonEnabled
                            ? updatePart3JpjTestResult('JALAN RAYA')
                            : customDialog.show(
                                context: context,
                                content:
                                    'Please connect to wifi before proceed',
                                title: const Center(
                                  child: Icon(
                                    Icons.wifi_off,
                                    color: Colors.red,
                                    size: 140,
                                  ),
                                ),
                                barrierDismissable: false,
                                type: DialogType.GENERAL,
                                customActions: [
                                  TextButton(
                                    onPressed: () {
                                      AppSettings.openAppSettings(
                                          type: AppSettingsType.wifi);
                                    },
                                    child: const Text('Settings'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.router.pop();
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            ColorConstant.primaryColor),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.translate('submit_btn'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(300),
                  ),
                ],
              ),
            ),
            LoadingModel(
              isVisible: isVisible,
              color: ColorConstant.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget totalScore() {
    int score = 0;
    int totalScore = 0;
    for (var element in ruleJson.keys) {
      score += ruleJson[element]!.where((c) => c.isCheck == true).length;
      totalScore += ruleJson[element]!.length;
    }

    return Text(
      'Jumlah Markah: $score/$totalScore',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget expandableList({required String code, required int numberRank}) {
    return SingleChildScrollView(
      child: ExpandableNotifier(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Container(
                    color: ColorConstant.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate('jr_session_$code'),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30, top: 5),
                              child: Container(
                                child: Text(
                                  '${ruleJson[code]!.where((c) => c.isCheck == true).length}/${ruleJson[code]!.length}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  collapsed: const SizedBox(),
                  expanded: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (int i = 0; i < ruleJson[code]!.length; i++)
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                            ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              if (ruleJson[code]![i].mandatory == 'true' &&
                                  ruleJson[code]![i].isCheck) {
                                String message =
                                    'Calon Ini Telah Gagal Kerana Kesalahan Mandatori.';
                                if (ruleJson[code]![i].ruleCode == 'i02' ||
                                    ruleJson[code]![i].ruleCode == 'i04') {
                                  message =
                                      'Calon Ini Telah Gagal Kerana Kemalangan.';
                                }
                                var wantContinue = await showDialog(
                                  context: context,
                                  barrierDismissible:
                                      true, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('JPJ QTO APP'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text(message),
                                            const Text('Adakah Anda Pasti?'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .translate('cancel_btn'),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .translate('ok_btn'),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (wantContinue) {
                                  setState(() {
                                    ruleJson[code]![i].isCheck = false;
                                  });
                                }
                              } else {
                                setState(() {
                                  if (ruleJson[code]![i].isCheck == null ||
                                      ruleJson[code]![i].isCheck == false) {
                                    ruleJson[code]![i].isCheck = true;
                                  } else {
                                    ruleJson[code]![i].isCheck = false;
                                  }
                                });
                              }
                            },
                            child: customCheckbox(
                              '$numberRank.${i + 1}',
                              ruleJson[code]![i],
                            ),
                          ),
                        ),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(
                        crossFadePoint: 0,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customCheckbox(String index, var item) {
    return ListTile(
      title: Text(
        '$index. ${item.ruleDesc}',
        style: TextStyle(
          fontWeight:
              item.mandatory == 'false' ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: (item.isCheck == null || item.isCheck == false)
                ? Colors.blue
                : Colors.grey.shade700,
          ),
          color: (item.isCheck == null || item.isCheck == false)
              ? Colors.blue
              : Colors.white,
        ),
        child: (item.isCheck == null || item.isCheck == false)
            ? const Icon(
                Icons.close,
                size: 18,
                color: Colors.white,
              )
            : const SizedBox(
                height: 18,
                width: 18,
              ),
      ),
    );
  }
}
