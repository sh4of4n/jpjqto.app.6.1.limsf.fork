import 'package:auto_route/auto_route.dart';
import 'package:jpj_qto/common_library/services/model/provider_model.dart';
import 'package:jpj_qto/common_library/services/repository/epandu_repository.dart';
import 'package:jpj_qto/common_library/utils/custom_dialog.dart';
import 'package:jpj_qto/common_library/utils/loading_model.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../router.gr.dart';
import 'sessions/session.dart';

// ignore: must_be_immutable
class JrPartIII extends StatefulWidget {
  final String qNo;
  final String nric;
  final String name;
  final String testDate;
  final String groupId;
  final String testCode;
  final String vehNo;

  JrPartIII(
    this.qNo,
    this.nric,
    this.name,
    this.testDate,
    this.groupId,
    this.testCode,
    this.vehNo,
  );

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

  @override
  void initState() {
    super.initState();

    updatePart3JpjTestStart();
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
          title: Icon(Icons.error_outline),
          content: result.message,
          customActions: [
            FlatButton(
              onPressed: () => ExtendedNavigator.of(context).popUntil(
                ModalRoute.withName(Routes.confirmCandidateInfo),
              ),
              child: Text('Ok'),
            ),
          ],
          type: DialogType.GENERAL);
    }

    setState(() {
      isVisible = false;
    });
  }

  Future<void> updatePart3JpjTestResult(part3Type) async {
    setState(() {
      isVisible = true;
    });

    String resultJson;

    if (part3Type == 'RPK') {
      resultJson =
          Provider.of<JrSessionModel>(context, listen: false).getRpkResults();
    } else {
      resultJson =
          Provider.of<JrSessionModel>(context, listen: false).getJrResults();
    }

    // print(resultJson);

    var result = await epanduRepo.updatePart3JpjTestResult(
      vehNo: widget.vehNo,
      resultJson: resultJson,
      testCode: widget.testCode,
      groupId: widget.groupId,
      icNo: widget.nric,
      part3Type: part3Type,
    );

    if (result.isSuccess) {
      // success += 1;

      // if (success == 2) {
      customDialog.show(
        context: context,
        barrierDismissable: false,
        onPressed: () {
          Provider.of<JrSessionModel>(context, listen: false).reset();

          ExtendedNavigator.of(context).popUntil(
            ModalRoute.withName(Routes.home),
          );
        },
        content: AppLocalizations.of(context).translate('test_submitted'),
        type: DialogType.SUCCESS,
      );
      // }
    } else {
      customDialog.show(
        context: context,
        content: 'Gagal mengemas kini rekod.',
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

    //         ExtendedNavigator.of(context).popUntil(
    //           ModalRoute.withName(Routes.home),
    //         );
    //       },
    //     ),
    //     TextButton(
    //       child: Text(AppLocalizations.of(context).translate('no_lbl')),
    //       onPressed: () {
    //         ExtendedNavigator.of(context).pop();
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
          title: Text('Jalan Raya'),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1, top: 2),
                    child: SessionA(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: SessionB(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: SessionC(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: SessionD(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: SessionE(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: SessionF(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: SessionG(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: SessionH(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: SessionI(),
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
                                AppLocalizations.of(context)
                                    .translate('session_lbl'),
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: Text(
                                AppLocalizations.of(context)
                                    .translate('normal_mistake_mark'),
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: Text(
                                AppLocalizations.of(context)
                                    .translate('mandatory_mistake_mark'),
                                style: TextStyle(color: Colors.black))),
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
                        Center(
                            child: Text('A',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$aMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/19',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$aMandatoryMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/1',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Text('B',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$bMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/7',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$bMandatoryMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/3',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Text('C',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$cMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/12',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$cMandatoryMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/6',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Text('D',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$dMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/13',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$dMandatoryMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/7',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Text('E',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$eMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/8',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$eMandatoryMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/6',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Text('F',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$fMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/7',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$fMandatoryMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/3',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Text('G',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$gMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/8',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$gMandatoryMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/4',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Text('H',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$hMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/6',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$hMandatoryMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/4',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Text('I',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: Text('-',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: '$iMandatoryMark',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/4',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(100),
                  ),
                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        // Future.wait([
                        //   updatePart3JpjTestResult('RPK'),
                        //   updatePart3JpjTestResult('JALAN RAYA'),
                        // ]);
                        updatePart3JpjTestResult('JALAN RAYA');
                      },
                      color: ColorConstant.primaryColor,
                      child: Text(
                        AppLocalizations.of(context).translate('submit_btn'),
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
}
