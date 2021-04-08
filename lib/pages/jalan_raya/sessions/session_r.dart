import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:jpj_qto/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;

class SessionR extends StatefulWidget {
  final Function() notifyParent;
  SessionR({Key key, this.notifyParent}) : super(key: key);

  @override
  _SessionRState createState() => _SessionRState();
}

class _SessionRState extends State<SessionR> {
  final localStorage = LocalStorage();

  int a1 = 0,
      a2 = 0,
      a3 = 0,
      a4 = 0,
      a5 = 0,
      a6 = 0,
      a7 = 0,
      a8 = 0,
      a9 = 0,
      a10 = 0,
      a11 = 0,
      a12 = 0,
      a13 = 0,
      a14 = 0,
      a15 = 0,
      a16 = 0,
      a17 = 0,
      a18 = 0,
      a19 = 0,
      a20 = 0,
      a21 = 0,
      a22 = 0,
      a23 = 0,
      a24 = 0;
  bool sessionB = false;
  int countSessionA = 0;
  int countMarkA = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context).translate('jr_session_r'),
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
                child: Text(
                  AppLocalizations.of(context)
                      .translate('part3_session_a_bold_lbl1'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (a1 == 1) {
                    a1 = 0;

                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a1 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a1')),
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
                          child: Text('$a1'),
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
                  if (a2 == 1) {
                    a2 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a2 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a2')),
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
                          child: Text('$a2'),
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
                  if (a3 == 1) {
                    a3 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a3 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a3')),
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
                          child: Text('$a3'),
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
                  if (a4 == 1) {
                    a4 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a4 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a4')),
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
                          child: Text('$a4'),
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
                  if (a5 == 1) {
                    a5 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a5 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a5')),
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
                          child: Text('$a5'),
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
                  if (a6 == 1) {
                    a6 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a6 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a6')),
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
                          child: Text('$a6'),
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
                  if (a7 == 1) {
                    a7 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a7 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a7')),
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
                          child: Text('$a7'),
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
                  if (a8 == 1) {
                    a8 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a8 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a8')),
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
                          child: Text('$a8'),
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
                  if (a9 == 1) {
                    a9 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a9 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a9')),
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
                          child: Text('$a9'),
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
                  if (a10 == 1) {
                    a10 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a10 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a10')),
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
                          child: Text('$a10'),
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
                  if (a11 == 1) {
                    a11 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a11 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a11')),
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
                          child: Text('$a11'),
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
                  if (a12 == 1) {
                    a12 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a12 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a12')),
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
                          child: Text('$a12'),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  AppLocalizations.of(context)
                      .translate('part3_session_a_bold_lbl2'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (a13 == 1) {
                    a13 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a13 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a13')),
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
                          child: Text('$a13'),
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
                  if (a14 == 1) {
                    a14 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a14 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a14')),
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
                          child: Text('$a14'),
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
                  if (a15 == 1) {
                    a15 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a15 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a15')),
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
                          child: Text('$a15'),
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
                  if (a16 == 1) {
                    a16 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a16 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a16')),
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
                          child: Text('$a16'),
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
                  if (a17 == 1) {
                    a17 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a17 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a17')),
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
                          child: Text('$a17'),
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
                  if (a18 == 1) {
                    a18 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a18 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a18')),
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
                          child: Text('$a18'),
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
                  if (a19 == 1) {
                    a19 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a19 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a19')),
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
                          child: Text('$a19'),
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
                  if (a20 == 1) {
                    a20 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a20 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a20')),
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
                          child: Text('$a20'),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  AppLocalizations.of(context)
                      .translate('part3_session_a_bold_lbl3'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey[400],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (a21 == 1) {
                    a21 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a21 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a21')),
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
                          child: Text('$a21'),
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
                  if (a22 == 1) {
                    a22 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a22 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a22')),
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
                          child: Text('$a22'),
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
                  if (a23 == 1) {
                    a23 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a23 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a23')),
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
                          child: Text('$a23'),
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
                  if (a24 == 1) {
                    a24 = 0;
                    countSessionA -= 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA += 1;
                    localStorage.setPart2MarkB(countMarkA);
                    widget.notifyParent();
                  } else {
                    a24 = 1;
                    countSessionA += 1;
                    localStorage.setPart3MarkSessionA(countSessionA);
                    countMarkA -= 1;
                    localStorage.setPart2MarkB(countMarkA);
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
                                .translate('part3_session_a24')),
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
                          child: Text('$a24'),
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
                            a1 = 1;
                            a2 = 1;
                            a3 = 1;
                            a4 = 1;
                            a5 = 1;
                            a6 = 1;
                            a7 = 1;
                            a8 = 1;
                            a9 = 1;
                            a10 = 1;
                            a11 = 1;
                            a12 = 1;
                            a13 = 1;
                            a14 = 1;
                            a15 = 1;
                            a16 = 1;
                            a17 = 1;
                            a18 = 1;
                            a19 = 1;
                            a20 = 1;
                            a21 = 1;
                            a22 = 1;
                            a23 = 1;
                            a24 = 1;
                            countSessionA = 24;
                            countMarkA = 0;
                            localStorage.setPart3MarkSessionA(countSessionA);
                            localStorage.setPart2MarkB(countMarkA);
                            widget.notifyParent();
                          } else {
                            a1 = 0;
                            a2 = 0;
                            a3 = 0;
                            a4 = 0;
                            a5 = 0;
                            a6 = 0;
                            a7 = 0;
                            a8 = 0;
                            a9 = 0;
                            a10 = 0;
                            a11 = 0;
                            a12 = 0;
                            a13 = 0;
                            a14 = 0;
                            a15 = 0;
                            a16 = 0;
                            a17 = 0;
                            a18 = 0;
                            a19 = 0;
                            a20 = 0;
                            a21 = 0;
                            a22 = 0;
                            a23 = 0;
                            a24 = 0;
                            countSessionA = 0;
                            countMarkA = 24;
                            localStorage.setPart3MarkSessionA(countSessionA);
                            localStorage.setPart2MarkB(countMarkA);
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
                '$countSessionA/24',
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
