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

  int marksA = 0;
  int marksB = 0;
  int marksC = 0;
  int marksD = 0;
  int marksE = 0;
  int marksF = 0;
  int marksG = 0;
  int marksH = 0;
  int marksI = 0;
  int marksJ = 0;

  int marksBM = 0;
  int marksCM = 0;
  int marksDM = 0;
  int marksEM = 0;
  int marksFM = 0;
  int marksGM = 0;
  int marksHM = 0;
  int marksIM = 0;
  int marksJM = 0;

  _getBMark() async {
    int _markA = await localStorage.getPart3MarkSessionA();
    int _markB = await localStorage.getPart3MarkB();
    int _markC = await localStorage.getPart3MarkC();
    int _markD = await localStorage.getPart3MarkD();
    int _markE = await localStorage.getPart3MarkE();
    int _markF = await localStorage.getPart3MarkF();
    int _markG = await localStorage.getPart3MarkG();
    int _markH = await localStorage.getPart3MarkH();
    int _markI = await localStorage.getPart3MarkI();
    int _markJ = await localStorage.getPart3MarkJ();

    int _markBM = await localStorage.getPart3MarkBM();
    int _markCM = await localStorage.getPart3MarkCM();
    int _markDM = await localStorage.getPart3MarkDM();
    int _markEM = await localStorage.getPart3MarkEM();
    int _markFM = await localStorage.getPart3MarkFM();
    int _markGM = await localStorage.getPart3MarkGM();
    int _markHM = await localStorage.getPart3MarkHM();
    int _markIM = await localStorage.getPart3MarkIM();
    int _markJM = await localStorage.getPart3MarkJM();

    setState(() {
      marksA = _markA;
      marksB = _markB;
      marksC = _markC;
      marksD = _markD;
      marksE = _markE;
      marksF = _markF;
      marksG = _markG;
      marksH = _markH;
      marksI = _markI;
      marksJ = _markJ;

      marksBM = _markBM;
      marksCM = _markCM;
      marksDM = _markDM;
      marksEM = _markEM;
      marksFM = _markFM;
      marksGM = _markGM;
      marksHM = _markHM;
      marksIM = _markIM;
      marksJM = _markJM;
    });
  }

  @override
  void initState() {
    super.initState();

    updatePart3JpjTestStart();
  }

  refresh() {
    setState(() {
      _getBMark();
    });
  }

  Future<void> updatePart3JpjTestStart() async {
    setState(() {
      isVisible = true;
    });

    var result = await epanduRepo.updatePart3JpjTestStart(
      groupId: widget.groupId,
      icNo: widget.nric,
      part3Type: 'RPK + JALAN RAYA',
      testCode: widget.testCode,
    );

    if (result.isSuccess) {
    } else {
      customDialog.show(
          context: context,
          content: 'JpjTestStart Fail.',
          type: DialogType.WARNING);
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

    var result = await epanduRepo.updatePart3JpjTestResult(
      vehNo: widget.vehNo,
      resultJson: resultJson,
      testCode: widget.testCode,
      groupId: widget.groupId,
      icNo: widget.nric,
      part3Type: part3Type,
    );

    if (result.isSuccess) {
      customDialog.show(
        context: context,
        barrierDismissable: false,
        onPressed: () => ExtendedNavigator.of(context).popUntil(
          ModalRoute.withName(Routes.home),
        ),
        content: 'Rekod berjaya dikemas kini.',
        type: DialogType.SUCCESS,
      );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 1, top: 2),
                  child: SessionR(),
                ),
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
                    TableRow(children: [
                      Center(
                          child:
                              Text('R', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksA',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/24',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                      Center(
                          child:
                              Text('-', style: TextStyle(color: Colors.black))),
                    ]),
                    TableRow(children: [
                      Center(
                          child:
                              Text('A', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksB',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/19',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksBM',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/1',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                    ]),
                    TableRow(children: [
                      Center(
                          child:
                              Text('B', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksC',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/7',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksCM',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/3',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                    ]),
                    TableRow(children: [
                      Center(
                          child:
                              Text('C', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksD',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/12',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksDM',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/6',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                    ]),
                    TableRow(children: [
                      Center(
                          child:
                              Text('D', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksE',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/13',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksEM',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/7',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                    ]),
                    TableRow(children: [
                      Center(
                          child:
                              Text('E', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksF',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/8',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksFM',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/6',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                    ]),
                    TableRow(children: [
                      Center(
                          child:
                              Text('F', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksG',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/7',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksGM',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/3',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                    ]),
                    TableRow(children: [
                      Center(
                          child:
                              Text('G', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksH',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/8',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksHM',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/4',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                    ]),
                    TableRow(children: [
                      Center(
                          child:
                              Text('H', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksI',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/6',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksIM',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                            TextSpan(
                                text: '/4',
                                style: TextStyle(color: Colors.black)),
                          ]))),
                    ]),
                    TableRow(children: [
                      Center(
                          child:
                              Text('I', style: TextStyle(color: Colors.black))),
                      Center(
                          child:
                              Text('-', style: TextStyle(color: Colors.black))),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: '$marksJM',
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
                      Future.wait([
                        updatePart3JpjTestResult('RPK'),
                        updatePart3JpjTestResult('JALAN RAYA'),
                      ]);
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
          ),
        ],
      ),
    );
  }
}
