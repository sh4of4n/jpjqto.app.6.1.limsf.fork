import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;

class SessionE extends StatefulWidget {
  final Function() notifyParent;
  SessionE({Key key, this.notifyParent}) : super(key: key);
  @override
  _SessionEState createState() => _SessionEState();
}

class _SessionEState extends State<SessionE> {
  final localStorage = LocalStorage();

  int f1 = 0,
      f2 = 0,
      f3 = 0,
      f4 = 0,
      f5 = 0,
      f6 = 0,
      f7 = 0,
      f8 = 0,
      f9 = 0,
      f10 = 0,
      f11 = 0,
      f12 = 0,
      f13 = 0,
      f14 = 0;
  //int countSessionF = 0;
  //int countSessionF = 0;
  int countMarkEM = 0;
  int countMarkF = 0;
  int countSessionF = 0;
  //int countDeductMarkF = 0;

  bool sessionF = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context).translate('jr_session_e'),
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
                  if (f1 == 1) {
                    f1 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);

                    widget.notifyParent();
                  } else {
                    f1 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
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
                                left: 10, top: 10, bottom: 10),
                            child: Text(AppLocalizations.of(context)
                                .translate('part3_session_f1')),
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
                          child: Text('$f1'),
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
                  if (f2 == 1) {
                    f2 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent();
                  } else {
                    f2 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
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
                                .translate('part3_session_f2')),
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
                          child: Text('$f2'),
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
                  if (f3 == 1) {
                    f3 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent();
                  } else {
                    f3 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
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
                                .translate('part3_session_f3')),
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
                          child: Text('$f3'),
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
                  if (f4 == 1) {
                    f4 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent();
                  } else {
                    f4 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
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
                                .translate('part3_session_f4')),
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
                          child: Text('$f4'),
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
                  if (f5 == 1) {
                    f5 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent();
                  } else {
                    f5 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
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
                                .translate('part3_session_f5')),
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
                          child: Text('$f5'),
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
                  if (f6 == 1) {
                    f6 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent();
                  } else {
                    f6 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
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
                                .translate('part3_session_f6')),
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
                              child: Text('$f6'),
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
                  if (f7 == 1) {
                    f7 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent();
                  } else {
                    f7 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
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
                                .translate('part3_session_f7')),
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
                          child: Text('$f7'),
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
                  if (f8 == 1) {
                    f8 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF -= 1;
                    localStorage.setPart3MarkF(countMarkF);
                    widget.notifyParent();
                  } else {
                    f8 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count normal deduct mark
                    countMarkF += 1;
                    localStorage.setPart3MarkF(countMarkF);
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
                                .translate('part3_session_f8')),
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
                          child: Text('$f8'),
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
                  if (f9 == 1) {
                    f9 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);

                    widget.notifyParent();
                  } else {
                    f9 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
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
                                    .translate('part3_session_f9_bold'),
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
                          child: Text('$f9'),
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
                  if (f10 == 1) {
                    f10 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent();
                  } else {
                    f10 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
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
                                  .translate('part3_session_f10_bold'),
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
                          child: Text('$f10'),
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
                  if (f11 == 1) {
                    f11 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent();
                  } else {
                    f11 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
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
                                  .translate('part3_session_f11_bold'),
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
                          child: Text('$f11'),
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
                  if (f12 == 1) {
                    f12 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent();
                  } else {
                    f12 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
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
                                  .translate('part3_session_f12_bold'),
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
                          child: Text('$f12'),
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
                  if (f13 == 1) {
                    f13 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent();
                  } else {
                    f13 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
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
                                  .translate('part3_session_f13_bold'),
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
                          child: Text('$f13'),
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
                  if (f14 == 1) {
                    f14 = 0;
                    countSessionF -= 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM -= 1;
                    localStorage.setPart3MarkFM(countMarkEM);
                    widget.notifyParent();
                  } else {
                    f14 = 1;
                    countSessionF += 1;
                    localStorage.setPart3MarkSessionF(countSessionF);

                    //count mandatory deduct mark
                    countMarkEM += 1;
                    localStorage.setPart3MarkFM(countMarkEM);
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
                                  .translate('part3_session_f14_bold'),
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
                          child: Text('$f14'),
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
                    value: sessionF,
                    onChanged: (bool value) {
                      setState(() {
                        sessionF = value;
                        setState(() {
                          if (value) {
                            f1 = 1;
                            f2 = 1;
                            f3 = 1;
                            f4 = 1;
                            f5 = 1;
                            f6 = 1;
                            f7 = 1;
                            f8 = 1;
                            f9 = 1;
                            f10 = 1;
                            f11 = 1;
                            f12 = 1;
                            f13 = 1;
                            countSessionF = 14;
                            localStorage.setPart3MarkSessionF(countSessionF);
                            countMarkEM = 6;
                            countMarkF = 8;
                            localStorage.setPart3MarkFM(countMarkEM);
                            localStorage.setPart3MarkF(countMarkF);
                            widget.notifyParent();
                          } else {
                            f1 = 0;
                            f2 = 0;
                            f3 = 0;
                            f4 = 0;
                            f5 = 0;
                            f6 = 0;
                            f7 = 0;
                            f8 = 0;
                            f9 = 0;
                            f10 = 0;
                            f11 = 0;
                            f12 = 0;
                            f13 = 0;
                            countSessionF = 0;
                            localStorage.setPart3MarkSessionF(countSessionF);
                            countMarkEM = 0;
                            countMarkF = 0;
                            localStorage.setPart3MarkFM(countMarkEM);
                            localStorage.setPart3MarkF(countMarkF);
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
                '$countSessionF/14',
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
