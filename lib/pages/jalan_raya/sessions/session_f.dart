import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;

class SessionF extends StatefulWidget {
  final Function() notifyParent;
  SessionF({Key key, this.notifyParent}) : super(key: key);

  @override
  _SessionFState createState() => _SessionFState();
}

class _SessionFState extends State<SessionF> {
  final localStorage = LocalStorage();

  int g1 = 0,
      g2 = 0,
      g3 = 0,
      g4 = 0,
      g5 = 0,
      g6 = 0,
      g7 = 0,
      g8 = 0,
      g9 = 0,
      g10 = 0,
      g11 = 0,
      g12 = 0;
  int countSessionG = 0;
  int countMarkGM = 0;
  int countMarkG = 0;

  bool sessionG = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context).translate('jr_session_f'),
              style:
                  (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                //child: Text('Pemeriksaan Luar Kenderaan(Calon Maklum Ada/Tiada)', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g1 == 1) {
                    g1 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  } else {
                    g1 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(10.0),
                  1: FlexColumnWidth(1.5),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)
                                .translate('part3_session_g1')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$g1'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g2 == 1) {
                    g2 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  } else {
                    g2 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)
                                .translate('part3_session_g2')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$g2'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g3 == 1) {
                    g3 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  } else {
                    g3 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)
                                .translate('part3_session_g3')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$g3'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g4 == 1) {
                    g4 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  } else {
                    g4 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)
                                .translate('part3_session_g4')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$g4'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g5 == 1) {
                    g5 = 0;
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  } else {
                    g5 = 1;
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)
                                .translate('part3_session_g5')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$g5'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g6 == 1) {
                    g6 = 0;
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  } else {
                    g6 = 1;
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)
                                .translate('part3_session_g6')),
                          )),
                    ),
                    Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12, top: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text('$g6'),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g7 == 1) {
                    g7 = 0;
                    countMarkG -= 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  } else {
                    g7 = 1;
                    countMarkG += 1;
                    localStorage.setPart3MarkG(countMarkG);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('part3_session_g7'),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$g7'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g8 == 1) {
                    g8 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  } else {
                    g8 = 1;
                    countMarkGM += 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('part3_session_g8_bold'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$g8'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g9 == 1) {
                    g9 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  } else {
                    g9 = 1;
                    countMarkGM += 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(
                                AppLocalizations.of(context)
                                    .translate('part3_session_g9_bold'),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$g9'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (g10 == 1) {
                    g10 = 0;
                    countMarkGM -= 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG -= 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  } else {
                    g10 = 1;
                    countMarkGM += 1;
                    localStorage.setPart3MarkGM(countMarkGM);

                    //total marks on top of checkbox
                    countSessionG += 1;
                    localStorage.setPart3MarkSessionH(countSessionG);
                    widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(ScreenUtil().setSp(10)),
                  1: FlexColumnWidth(ScreenUtil().setSp(1.5)),
                },
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('part3_session_g10_bold'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('$g10'),
                        )),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 25, top: 5),
            child: Wrap(
              children: <Widget>[
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    value: sessionG,
                    onChanged: (bool value) {
                      setState(() {
                        sessionG = value;
                        setState(() {
                          if (value) {
                            g1 = 1;
                            g2 = 1;
                            g3 = 1;
                            g4 = 1;
                            g5 = 1;
                            g6 = 1;
                            g7 = 1;
                            g8 = 1;
                            g9 = 1;
                            g10 = 1;
                            g11 = 1;
                            g12 = 1;
                            countSessionG = 10;
                            countMarkGM = 3;
                            countMarkG = 7;
                            localStorage.setPart3MarkSessionH(countSessionG);
                            localStorage.setPart3MarkGM(countMarkGM);
                            localStorage.setPart3MarkG(countMarkG);
                            widget.notifyParent();
                          } else {
                            g1 = 0;
                            g2 = 0;
                            g3 = 0;
                            g4 = 0;
                            g5 = 0;
                            g6 = 0;
                            g7 = 0;
                            g8 = 0;
                            g9 = 0;
                            g10 = 0;
                            g11 = 0;
                            g12 = 0;
                            countSessionG = 0;
                            countMarkGM = 0;
                            countMarkG = 0;
                            localStorage.setPart3MarkSessionH(countSessionG);
                            localStorage.setPart3MarkGM(countMarkGM);
                            localStorage.setPart3MarkG(countMarkG);
                            widget.notifyParent();
                          }
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 35, top: 5),
            child: Container(
              child: Text(
                '$countSessionG/10',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
