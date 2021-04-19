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

class SessionD extends StatefulWidget {
  final Function() notifyParent;
  SessionD({Key key, this.notifyParent}) : super(key: key);

  @override
  _SessionDState createState() => _SessionDState();
}

class _SessionDState extends State<SessionD> {
  final localStorage = LocalStorage();

  int e1 = 0,
      e2 = 0,
      e3 = 0,
      e4 = 0,
      e5 = 0,
      e6 = 0,
      e7 = 0,
      e8 = 0,
      e9 = 0,
      e10 = 0,
      e11 = 0,
      e12 = 0,
      e13 = 0,
      e14 = 0,
      e15 = 0,
      e16 = 0,
      e17 = 0,
      e18 = 0,
      e19 = 0,
      e20 = 0;

  int countMarkEM = 0;
  int countMarkE = 0;

  int countSessionE = 0;
  bool sessionE = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context).translate('jr_session_d'),
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
                  if (e1 == 1) {
                    e1 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e1: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);

                    // widget.notifyParent();
                  } else {
                    e1 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e1: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e1')),
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
                          child: Text('$e1'),
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
                  if (e2 == 1) {
                    e2 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e2: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e2 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e2: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e2')),
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
                          child: Text('$e2'),
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
                  if (e3 == 1) {
                    e3 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e3: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e3 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e3: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e3')),
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
                          child: Text('$e3'),
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
                  if (e4 == 1) {
                    e4 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e4: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e4 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e4: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e4')),
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
                          child: Text('$e4'),
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
                  if (e5 == 1) {
                    e5 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e5: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e5 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e5: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e5')),
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
                          child: Text('$e5'),
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
                  if (e6 == 1) {
                    e6 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e6: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e6 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e6: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct normal mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e6')),
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
                              child: Text('$e6'),
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
                  if (e7 == 1) {
                    e7 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e7: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e7 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e7: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e7')),
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
                          child: Text('$e7'),
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
                  if (e8 == 1) {
                    e8 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e8: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e8 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e8: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e8')),
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
                          child: Text('$e8'),
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
                  if (e9 == 1) {
                    e9 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e9: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e9 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e9: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e9')),
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
                          child: Text('$e9'),
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
                  if (e10 == 1) {
                    e10 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e10: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e10 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e10: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e10')),
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
                          child: Text('$e10'),
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
                  if (e11 == 1) {
                    e11 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e11: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e11 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e11: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e11')),
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
                          child: Text('$e11'),
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
                  if (e12 == 1) {
                    e12 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e12: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e12 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e12: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e12')),
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
                          child: Text('$e12'),
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
                  if (e13 == 1) {
                    e13 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e13: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE -= 1;
                    localStorage.setPart3MarkE(countMarkE);
                    // widget.notifyParent();
                  } else {
                    e13 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e13: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkE += 1;
                    localStorage.setPart3MarkE(countMarkE);
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
                                .translate('part3_session_e13')),
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
                          child: Text('$e13'),
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
                  if (e14 == 1) {
                    e14 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e14: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    // widget.notifyParent();
                  } else {
                    e14 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e14: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
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
                                  .translate('part3_session_e14_bold'),
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
                          child: Text('$e14'),
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
                  if (e15 == 1) {
                    e15 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e15: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    // widget.notifyParent();
                  } else {
                    e15 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e15: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
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
                                  .translate('part3_session_e15_bold'),
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
                          child: Text('$e15'),
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
                  if (e16 == 1) {
                    e16 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e16: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    // widget.notifyParent();
                  } else {
                    e16 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e16: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
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
                                  .translate('part3_session_e16_bold'),
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
                          child: Text('$e16'),
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
                  if (e17 == 1) {
                    e17 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e17: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    // widget.notifyParent();
                  } else {
                    e17 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e17: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
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
                                  .translate('part3_session_e17_bold'),
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
                          child: Text('$e17'),
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
                  if (e18 == 1) {
                    e18 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e18: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    // widget.notifyParent();
                  } else {
                    e18 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e18: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
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
                                  .translate('part3_session_e18_bold'),
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
                          child: Text('$e18'),
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
                  if (e19 == 1) {
                    e19 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e19: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    // widget.notifyParent();
                  } else {
                    e19 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e19: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
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
                                  .translate('part3_session_e19_bold'),
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
                          child: Text('$e19'),
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
                  if (e20 == 1) {
                    e20 = 0;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e20: 0);
                    countSessionE -= 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkEM(countMarkEM);
                    // widget.notifyParent();
                  } else {
                    e20 = 1;
                    Provider.of<JrSessionModel>(context, listen: false)
                        .setResultE(e20: 1);
                    countSessionE += 1;
                    localStorage.setPart3MarkSessionE(countSessionE);

                    //count deduct mandatory mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkEM(countMarkEM);
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
                                  .translate('part3_session_e20_bold'),
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
                          child: Text('$e20'),
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
                    value: sessionE,
                    onChanged: (bool value) {
                      setState(() {
                        sessionE = value;
                        setState(() {
                          if (value) {
                            e1 = 1;
                            e2 = 1;
                            e3 = 1;
                            e4 = 1;
                            e5 = 1;
                            e6 = 1;
                            e7 = 1;
                            e8 = 1;
                            e9 = 1;
                            e10 = 1;
                            e11 = 1;
                            e12 = 1;
                            e13 = 1;
                            e14 = 1;
                            e15 = 1;
                            e16 = 1;
                            e17 = 1;
                            e18 = 1;
                            countSessionE = 20;
                            localStorage.setPart3MarkSessionE(countSessionE);

                            countMarkEM = 7;
                            localStorage.setPart3MarkEM(countMarkEM);
                            countMarkE = 13;
                            localStorage.setPart3MarkE(countMarkE);
                            // widget.notifyParent();
                          } else {
                            e1 = 0;
                            e2 = 0;
                            e3 = 0;
                            e4 = 0;
                            e5 = 0;
                            e6 = 0;
                            e7 = 0;
                            e8 = 0;
                            e9 = 0;
                            e10 = 0;
                            e11 = 0;
                            e12 = 0;
                            e13 = 0;
                            e14 = 0;
                            e15 = 0;
                            e16 = 0;
                            e17 = 0;
                            e18 = 0;
                            countSessionE = 0;
                            localStorage.setPart3MarkSessionE(countSessionE);
                            countMarkEM = 0;
                            localStorage.setPart3MarkEM(countMarkEM);
                            countMarkE = 0;
                            localStorage.setPart3MarkE(countMarkE);
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
                '$countSessionE/20',
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
