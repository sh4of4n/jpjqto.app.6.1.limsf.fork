import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;

class SessionC extends StatefulWidget {
  final Function() notifyParent;
  SessionC({Key key, this.notifyParent}) : super(key: key);

  @override
  _SessionCState createState() => _SessionCState();
}

class _SessionCState extends State<SessionC> {
  final localStorage = LocalStorage();

  int d1 = 0,
      d2 = 0,
      d3 = 0,
      d4 = 0,
      d5 = 0,
      d6 = 0,
      d7 = 0,
      d8 = 0,
      d9 = 0,
      d10 = 0,
      d11 = 0,
      d12 = 0,
      d13 = 0,
      d14 = 0,
      d15 = 0,
      d16 = 0,
      d17 = 0,
      d18 = 0;
  int countSessionD = 0;
  int countMarkDM = 0;
  int countMarkD = 0;
  bool sessionD = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context).translate('jr_session_c'),
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
                  if (d1 == 1) {
                    d1 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d1 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d1')),
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
                          child: Text('$d1'),
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
                  if (d2 == 1) {
                    d2 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d2 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d2')),
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
                          child: Text('$d2'),
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
                  if (d3 == 1) {
                    d3 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d3 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d3')),
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
                          child: Text('$d3'),
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
                  if (d4 == 1) {
                    d4 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d4 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d4')),
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
                          child: Text('$d4'),
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
                  if (d5 == 1) {
                    d5 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d5 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d5')),
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
                          child: Text('$d5'),
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
                  if (d6 == 1) {
                    d6 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d6 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d6')),
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
                              child: Text('$d6'),
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
                  if (d7 == 1) {
                    d7 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d7 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d7')),
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
                          child: Text('$d7'),
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
                  if (d8 == 1) {
                    d8 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d8 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d8')),
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
                          child: Text('$d8'),
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
                  if (d9 == 1) {
                    d9 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d9 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d9')),
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
                          child: Text('$d9'),
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
                  if (d10 == 1) {
                    d10 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d10 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d10')),
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
                          child: Text('$d10'),
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
                  if (d11 == 1) {
                    d11 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD -= 1;
                    localStorage.setPart3MarkD(countMarkD);
                    widget.notifyParent();
                  } else {
                    d11 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkD += 1;
                    localStorage.setPart3MarkD(countMarkD);
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
                                .translate('part3_session_d11')),
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
                          child: Text('$d11'),
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
                  if (d12 == 1) {
                    d12 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent();
                  } else {
                    d12 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
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
                                .translate('part3_session_d12')),
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
                          child: Text('$d12'),
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
                  if (d13 == 1) {
                    d13 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent();
                  } else {
                    d13 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
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
                                  .translate('part3_session_d13_bold'),
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
                          child: Text('$d13'),
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
                  if (d14 == 1) {
                    d14 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent();
                  } else {
                    d14 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
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
                                  .translate('part3_session_d14_bold'),
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
                          child: Text('$d14'),
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
                  if (d15 == 1) {
                    d15 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent();
                  } else {
                    d15 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
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
                                  .translate('part3_session_d15_bold'),
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
                          child: Text('$d15'),
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
                  if (d16 == 1) {
                    d16 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent();
                  } else {
                    d16 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
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
                                  .translate('part3_session_d16_bold'),
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
                          child: Text('$d16'),
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
                  if (d17 == 1) {
                    d17 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent();
                  } else {
                    d17 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
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
                                  .translate('part3_session_d17_bold'),
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
                          child: Text('$d17'),
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
                  if (d18 == 1) {
                    d18 = 0;
                    countSessionD -= 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM -= 1;
                    localStorage.setPart3MarkDM(countMarkDM);
                    widget.notifyParent();
                  } else {
                    d18 = 1;
                    countSessionD += 1;
                    localStorage.setPart3MarkSessionD(countSessionD);
                    countMarkDM += 1;
                    localStorage.setPart3MarkDM(countMarkDM);
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
                                  .translate('part3_session_d18_bold'),
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
                          child: Text('$d18'),
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
                    value: sessionD,
                    onChanged: (bool value) {
                      setState(() {
                        sessionD = value;
                        setState(() {
                          if (value) {
                            d1 = 1;
                            d2 = 1;
                            d3 = 1;
                            d4 = 1;
                            d5 = 1;
                            d6 = 1;
                            d7 = 1;
                            d8 = 1;
                            d9 = 1;
                            d10 = 1;
                            d11 = 1;
                            d12 = 1;
                            d13 = 1;
                            d14 = 1;
                            d15 = 1;
                            d16 = 1;
                            d17 = 1;
                            d18 = 1;
                            countSessionD = 18;
                            localStorage.setPart3MarkSessionD(countSessionD);
                            countMarkD = 12;
                            countMarkDM = 6;
                            localStorage.setPart3MarkD(countMarkD);
                            localStorage.setPart3MarkDM(countMarkDM);
                            widget.notifyParent();
                          } else {
                            d1 = 0;
                            d2 = 0;
                            d3 = 0;
                            d4 = 0;
                            d5 = 0;
                            d6 = 0;
                            d7 = 0;
                            d8 = 0;
                            d9 = 0;
                            d10 = 0;
                            d11 = 0;
                            d12 = 0;
                            d13 = 0;
                            d14 = 0;
                            d15 = 0;
                            d16 = 0;
                            d17 = 0;
                            d18 = 0;
                            countSessionD = 0;
                            localStorage.setPart3MarkSessionD(countSessionD);
                            countMarkD = 0;
                            countMarkDM = 0;
                            localStorage.setPart3MarkD(countMarkD);
                            localStorage.setPart3MarkDM(countMarkDM);
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
                '$countSessionD/18',
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
