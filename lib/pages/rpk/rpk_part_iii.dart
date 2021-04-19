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
import 'list_part_iii.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class RpkPartIII extends StatefulWidget {
  final String qNo;
  final String nric;
  final String name;
  final String testDate;
  final String groupId;
  final String testCode;
  final String vehNo;

  RpkPartIII(
    this.qNo,
    this.nric,
    this.name,
    this.testDate,
    this.groupId,
    this.testCode,
    this.vehNo,
  );

  @override
  _Part3MainState createState() => _Part3MainState();
}

class _Part3MainState extends State<RpkPartIII> {
  final image = ImagesConstant();
  final localStorage = LocalStorage();
  final primaryColor = ColorConstant.primaryColor;
  final textStyle = TextStyle(
    fontSize: 60.sp,
    color: Colors.black,
  );
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
      testCode: widget.testCode,
      groupId: widget.groupId,
      icNo: widget.nric,
      part3Type: 'RPK',
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

  updatePart3JpjTestResult() async {
    setState(() {
      isVisible = true;
    });

    String resultJson =
        Provider.of<RpkSessionModel>(context, listen: false).getRpkResult();

    var result = await epanduRepo.updatePart3JpjTestResult(
      vehNo: widget.vehNo,
      resultJson: resultJson,
      testCode: widget.testCode,
      groupId: widget.groupId,
      icNo: widget.nric,
      part3Type: 'RPK',
    );

    if (result.isSuccess) {
      customDialog.show(
          context: context,
          barrierDismissable: false,
          onPressed: () => ExtendedNavigator.of(context).popUntil(
                ModalRoute.withName(Routes.home),
              ),
          content: 'Rekod berjaya dikemas kini.',
          type: DialogType.SUCCESS);
    } else {
      customDialog.show(
          context: context,
          content: 'Gagal mengemas kini rekod.',
          type: DialogType.WARNING);
    }

    setState(() {
      isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RPK')),
      /*appBar: AppBar(
        title: Text('RSM',style: TextStyle(color: Colors.black),),
      ),
      drawer: RPKDrawer(),*/

      /*body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),*/
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // _header(),
                //RpkSessionA(),
                Container(
                  color: primaryColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
                  child: Column(
                    children: [
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Text('Tarikh'),
                              Text(widget.testDate, style: textStyle),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('Nama'),
                              Text(widget.name, style: textStyle),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('NRIC'),
                              Text(widget.nric, style: textStyle),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('No Giliran'),
                              Text(widget.qNo,
                                  style: TextStyle(
                                      fontSize: 80.sp,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1, top: 2),
                  child: SessionA(),
                ),
                /* Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: SessionB(notifyParent: refresh),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: SessionC(notifyParent: refresh),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: SessionD(notifyParent: refresh),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: SessionE(notifyParent: refresh),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: SessionF(notifyParent: refresh),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: SessionG(notifyParent: refresh),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: SessionH(notifyParent: refresh),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: SessionI(notifyParent: refresh),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: SessionJ(notifyParent: refresh),
              ), */

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
                    /* TableRow(children: [
                    Center(
                        child: Text('B', style: TextStyle(color: Colors.black))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksB',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/19', style: TextStyle(color: Colors.black)),
                        ]))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksBM',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/1', style: TextStyle(color: Colors.black)),
                        ]))),
                  ]),
                  TableRow(children: [
                    Center(
                        child: Text('C', style: TextStyle(color: Colors.black))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksC',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/7', style: TextStyle(color: Colors.black)),
                        ]))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksCM',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/3', style: TextStyle(color: Colors.black)),
                        ]))),
                  ]),
                  TableRow(children: [
                    Center(
                        child: Text('D', style: TextStyle(color: Colors.black))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksD',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/12', style: TextStyle(color: Colors.black)),
                        ]))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksDM',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/6', style: TextStyle(color: Colors.black)),
                        ]))),
                  ]),
                  TableRow(children: [
                    Center(
                        child: Text('E', style: TextStyle(color: Colors.black))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksE',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/13', style: TextStyle(color: Colors.black)),
                        ]))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksEM',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/7', style: TextStyle(color: Colors.black)),
                        ]))),
                  ]),
                  TableRow(children: [
                    Center(
                        child: Text('F', style: TextStyle(color: Colors.black))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksF',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/8', style: TextStyle(color: Colors.black)),
                        ]))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksFM',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/6', style: TextStyle(color: Colors.black)),
                        ]))),
                  ]),
                  TableRow(children: [
                    Center(
                        child: Text('G', style: TextStyle(color: Colors.black))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksG',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/7', style: TextStyle(color: Colors.black)),
                        ]))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksGM',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/3', style: TextStyle(color: Colors.black)),
                        ]))),
                  ]),
                  TableRow(children: [
                    Center(
                        child: Text('H', style: TextStyle(color: Colors.black))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksH',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/8', style: TextStyle(color: Colors.black)),
                        ]))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksHM',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/4', style: TextStyle(color: Colors.black)),
                        ]))),
                  ]),
                  TableRow(children: [
                    Center(
                        child: Text('I', style: TextStyle(color: Colors.black))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksI',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/6', style: TextStyle(color: Colors.black)),
                        ]))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksIM',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/4', style: TextStyle(color: Colors.black)),
                        ]))),
                  ]),
                  TableRow(children: [
                    Center(
                        child: Text('J', style: TextStyle(color: Colors.black))),
                    Center(
                        child: Text('-', style: TextStyle(color: Colors.black))),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                text: '$marksJM',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: '/4', style: TextStyle(color: Colors.black)),
                        ]))),
                  ]), */
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(100),
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () async {
                      /* localStorage.setPart2MarkSessionB(0);
                    localStorage.setPart2MarkSessionC(0);
                    localStorage.setPart2MarkSessionD(0);
                    localStorage.setPart2MarkSessionE(0);
                    localStorage.setPart2MarkSessionF(0);
                    localStorage.setPart2MarkSessionG(0);

                    localStorage.setPart2MarkSessionHM(0);
                    localStorage.setPart2MarkSessionBM(0);
                    localStorage.setPart2MarkCM(0);
                    localStorage.setPart2MarkDM(0);
                    localStorage.setPart2MarkEM(0);
                    localStorage.setPart2MarkFM(0);
                    localStorage.setPart2MarkGM(0);
                    localStorage.setPart2MarkGM(0);
                    refresh(); */

                      var result =
                          await epanduRepo.getPart3AvailableToCallJpjTestList(
                        part3Type: 'RPK',
                      );

                      if (result.isSuccess) {
                        updatePart3JpjTestResult();
                      }
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
