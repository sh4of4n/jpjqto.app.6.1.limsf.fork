import 'package:jpj_qto/common_library/services/model/provider_model.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;
import 'package:provider/provider.dart';

final localStorage = LocalStorage();

class SessionA extends StatefulWidget {
  final Function() notifyParent;
  SessionA({Key key, this.notifyParent}) : super(key: key);

  @override
  _SessionAState createState() => _SessionAState();
}

class _SessionAState extends State<SessionA> {
  int b1 = 0,
      b2 = 0,
      b3 = 0,
      b4 = 0,
      b5 = 0,
      b6 = 0,
      b7 = 0,
      b8 = 0,
      b9 = 0,
      b10 = 0,
      b11 = 0,
      b12 = 0,
      b13 = 0,
      b14 = 0,
      b15 = 0,
      b16 = 0,
      b17 = 0,
      b18 = 0,
      b19 = 0,
      b20 = 0;
  bool sessionB = false;
  int countSessionB = 0;
  int countMarkBN = 0;
  int countMarkBM = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context).translate('jr_session_a'),
              style:
                  (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          headerBackgroundColor: ColorConstant.primaryColor,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  if (b1 == 1) {
                    b1 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b1: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b1 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b1: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  }
                });
              },
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(10.0),
                  1: FlexColumnWidth(1.5),
                }, //part3_session_b
                children: [
                  TableRow(children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(AppLocalizations.of(context)
                                .translate('part3_session_b1')),
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
                          child: Text('$b1'),
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
                  if (b2 == 1) {
                    b2 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b2: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b2 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b2: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b2')),
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
                          child: Text('$b2'),
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
                  if (b3 == 1) {
                    b3 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b3: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b3 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b3: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b3')),
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
                          child: Text('$b3'),
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
                  if (b4 == 1) {
                    b4 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b4: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b4 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b4: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b4')),
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
                          child: Text('$b4'),
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
                      .translate('part3_session_b_bold_lbl1'),
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
                  if (b5 == 1) {
                    b5 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b5: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b5 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b5: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b5')),
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
                          child: Text('$b5'),
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
                  if (b6 == 1) {
                    b6 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b6: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b6 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b6: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b6')),
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
                          child: Text('$b6'),
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
                  if (b7 == 1) {
                    b7 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b7: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b7 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b7: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b7')),
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
                          child: Text('$b7'),
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
                  if (b8 == 1) {
                    b8 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b8: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b8 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b8: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b8')),
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
                          child: Text('$b8'),
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
                  if (b9 == 1) {
                    b9 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b9: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b9 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b9: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b9')),
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
                          child: Text('$b9'),
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
                  if (b10 == 1) {
                    b10 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b10: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b10 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b10: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b10')),
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
                          child: Text('$b10'),
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
                  if (b11 == 1) {
                    b11 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b11: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b11 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b11: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b11')),
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
                          child: Text('$b11'),
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
                      .translate('part3_session_b_bold_lbl2'),
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
                  if (b12 == 1) {
                    b12 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b12: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b12 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b12: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b12')),
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
                          child: Text('$b12'),
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
                  if (b13 == 1) {
                    b13 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b13: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b13 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b13: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b13')),
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
                          child: Text('$b13'),
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
                  if (b14 == 1) {
                    b14 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b14: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b14 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b14: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b14')),
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
                          child: Text('$b14'),
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
                  if (b15 == 1) {
                    b15 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b15: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b15 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b15: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b15')),
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
                          child: Text('$b15'),
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
                  if (b16 == 1) {
                    b16 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b16: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b16 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b16: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b16')),
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
                          child: Text('$b16'),
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
                  if (b17 == 1) {
                    b17 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b17: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b17 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b17: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b17')),
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
                          child: Text('$b17'),
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
                  if (b18 == 1) {
                    b18 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b18: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b18 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b18: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b18')),
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
                          child: Text('$b18'),
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
                  if (b19 == 1) {
                    b19 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b19: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN -= 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
                  } else {
                    b19 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b19: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBN += 1;
                    localStorage.setPart3MarkB(countMarkBN);
                    // widget.notifyParent();
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
                                .translate('part3_session_b19')),
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
                          child: Text('$b19'),
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
                  if (b20 == 1) {
                    b20 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b20: 0);
                    countSessionB -= 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBM -= 1;
                    localStorage.setPart3MarkBM(countMarkBM);
                    // widget.notifyParent();
                  } else {
                    b20 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultB(b20: 1);
                    countSessionB += 1;
                    localStorage.setPart3MarkSessionB(countSessionB);
                    countMarkBM += 1;
                    localStorage.setPart3MarkBM(countMarkBM);
                    // widget.notifyParent();
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
                                  .translate('part3_session_b20_bold'),
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
                          child: Text('$b20'),
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
                            b1 = 1;
                            b2 = 1;
                            b3 = 1;
                            b4 = 1;
                            b5 = 1;
                            b6 = 1;
                            b7 = 1;
                            b8 = 1;
                            b9 = 1;
                            b10 = 1;
                            b11 = 1;
                            b12 = 1;
                            b13 = 1;
                            b14 = 1;
                            b15 = 1;
                            b16 = 1;
                            b17 = 1;
                            b18 = 1;
                            b19 = 1;
                            b20 = 1;
                            countSessionB = 20;
                            countMarkBN = 19;
                            countMarkBM = 1;
                            localStorage.setPart3MarkBM(countMarkBM);
                            localStorage.setPart3MarkSessionB(countSessionB);
                            localStorage.setPart3MarkB(countMarkBN);
                            // widget.notifyParent();
                          } else {
                            b1 = 0;
                            b2 = 0;
                            b3 = 0;
                            b4 = 0;
                            b5 = 0;
                            b6 = 0;
                            b7 = 0;
                            b8 = 0;
                            b9 = 0;
                            b10 = 0;
                            b11 = 0;
                            b12 = 0;
                            b13 = 0;
                            b14 = 0;
                            b15 = 0;
                            b16 = 0;
                            b17 = 0;
                            b18 = 0;
                            b19 = 0;
                            b20 = 0;
                            countSessionB = 0;
                            countMarkBN = 0;
                            countMarkBM = 0;
                            localStorage.setPart3MarkBM(countMarkBM);
                            localStorage.setPart3MarkSessionB(countSessionB);
                            localStorage.setPart3MarkB(countMarkBN);
                            // widget.notifyParent();
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
                '$countSessionB/20',
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
