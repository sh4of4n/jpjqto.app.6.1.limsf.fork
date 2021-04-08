import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;

class SessionB extends StatefulWidget {
  final Function() notifyParent;
  SessionB({Key key, this.notifyParent}) : super(key: key);

  @override
  _SessionBState createState() => _SessionBState();
}

class _SessionBState extends State<SessionB> {
  final localStorage = LocalStorage();

  int c1 = 0,
      c2 = 0,
      c3 = 0,
      c4 = 0,
      c5 = 0,
      c6 = 0,
      c7 = 0,
      c8 = 0,
      c9 = 0,
      c10 = 0;
  int countSessionC = 0;

  int countMarkCM = 0;
  int countMarkC = 0;
  bool sessionB = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context).translate('jr_session_b'),
              style:
                  (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          headerBackgroundColor: ColorConstant.primaryColor,
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
                  if (c1 == 1) {
                    c1 = 0;
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC -= 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent();
                  } else {
                    c1 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
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
                                .translate('part3_session_c1')),
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
                          child: Text('$c1'),
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
                  if (c2 == 1) {
                    c2 = 0;
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent();
                  } else {
                    c2 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct marks
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
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
                                .translate('part3_session_c2')),
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
                          child: Text('$c2'),
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
                  if (c3 == 1) {
                    c3 = 0;
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent();
                  } else {
                    c3 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
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
                                .translate('part3_session_c3')),
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
                          child: Text('$c3'),
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
                  if (c4 == 1) {
                    c4 = 0;
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC -= 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent();
                  } else {
                    c4 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);

                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
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
                                .translate('part3_session_c4')),
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
                          child: Text('$c4'),
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
                  if (c5 == 1) {
                    c5 = 0;
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
                    widget.notifyParent();
                  } else {
                    c5 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
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
                                .translate('part3_session_c5')),
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
                          child: Text('$c5'),
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
                  if (c6 == 1) {
                    c6 = 0;
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC -= 1;
                    localStorage.setPart3MarkC(countMarkC);
                  } else {
                    c6 = 1;
                    countSessionC += 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
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
                                .translate('part3_session_c6')),
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
                              child: Text('$c6'),
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
                  if (c7 == 1) {
                    c7 = 0;
                    countSessionC -= 1;
                    localStorage.setPart3MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC -= 1;
                    localStorage.setPart3MarkC(countMarkC);
                  } else {
                    c7 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    //count normal deduct mark
                    countMarkC += 1;
                    localStorage.setPart3MarkC(countMarkC);
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
                                .translate('part3_session_c7')),
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
                          child: Text('$c7'),
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
                  if (c8 == 1) {
                    c8 = 0;
                    countMarkCM -= 1;
                    localStorage.setPart3MarkCM(countMarkCM);
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent();
                  } else {
                    c8 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    countMarkCM += 1;
                    localStorage.setPart3MarkCM(countMarkCM);
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
                                    .translate('part3_session_c8_bold'),
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
                          child: Text('$c8'),
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
                  if (c9 == 1) {
                    c9 = 0;
                    countMarkCM -= 1;
                    localStorage.setPart3MarkCM(countMarkCM);
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent();
                  } else {
                    c9 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    countMarkCM += 1;
                    localStorage.setPart3MarkCM(countMarkCM);
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
                                    .translate('part3_session_c9_bold'),
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
                          child: Text('$c9'),
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
                  if (c10 == 1) {
                    c10 = 0;
                    countMarkCM -= 1;
                    localStorage.setPart3MarkCM(countMarkCM);
                    countSessionC -= 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    widget.notifyParent();
                  } else {
                    c10 = 1;
                    countSessionC += 1;
                    localStorage.setPart2MarkSessionC(countSessionC);
                    countMarkCM += 1;
                    localStorage.setPart3MarkCM(countMarkCM);
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
                                  .translate('part3_session_c10_bold'),
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
                          child: Text('$c10'),
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
                    value: sessionB,
                    onChanged: (bool value) {
                      setState(() {
                        sessionB = value;
                        setState(() {
                          if (value) {
                            c1 = 1;
                            c2 = 1;
                            c3 = 1;
                            c4 = 1;
                            c5 = 1;
                            c6 = 1;
                            c7 = 1;
                            c8 = 1;
                            c9 = 1;
                            c10 = 1;
                            countSessionC = 10;
                            localStorage.setPart3MarkSessionC(countSessionC);
                            countMarkCM = 3;
                            countMarkC = 7;
                            localStorage.setPart3MarkCM(countMarkCM);
                            localStorage.setPart3MarkC(countMarkC);
                            widget.notifyParent();
                          } else {
                            c1 = 0;
                            c2 = 0;
                            c3 = 0;
                            c4 = 0;
                            c5 = 0;
                            c6 = 0;
                            c7 = 0;
                            c8 = 0;
                            c9 = 0;
                            c10 = 0;
                            countSessionC = 0;
                            localStorage.setPart3MarkSessionC(countSessionC);
                            countMarkCM = 0;
                            countMarkC = 0;
                            localStorage.setPart3MarkCM(countMarkCM);
                            localStorage.setPart3MarkC(countMarkC);
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
            padding: const EdgeInsets.only(right: 30, top: 5),
            child: Container(
              child: Text(
                '$countSessionC/10',
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
