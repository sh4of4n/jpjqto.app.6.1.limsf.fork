import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;

class SessionH extends StatefulWidget {
  final Function() notifyParent;
  SessionH({Key key, this.notifyParent}) : super(key: key);

  @override
  _SessionHState createState() => _SessionHState();
}

class _SessionHState extends State<SessionH> {
  final localStorage = LocalStorage();

  int i1 = 0,
      i2 = 0,
      i3 = 0,
      i4 = 0,
      i5 = 0,
      i6 = 0,
      i7 = 0,
      i8 = 0,
      i9 = 0,
      i10 = 0;
  int countSessionI = 0;
  int countMarkIM = 0;
  int countMarkI = 0;
  bool sessionI = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              AppLocalizations.of(context).translate('jr_session_h'),
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
                  if (i1 == 1) {
                    i1 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent();
                  } else {
                    i1 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
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
                                .translate('part3_session_i1')),
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
                          child: Text('$i1'),
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
                  if (i2 == 1) {
                    i2 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent();
                  } else {
                    i2 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
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
                                .translate('part3_session_i2')),
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
                          child: Text('$i2'),
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
                  if (i3 == 1) {
                    i3 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent();
                  } else {
                    i3 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
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
                                .translate('part3_session_i3')),
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
                          child: Text('$i3'),
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
                  if (i4 == 1) {
                    i4 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent();
                  } else {
                    i4 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
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
                                .translate('part3_session_i4')),
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
                          child: Text('$i4'),
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
                  if (i5 == 1) {
                    i5 = 0;
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);
                    widget.notifyParent();
                  } else {
                    i5 = 1;
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);
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
                                .translate('part3_session_i5')),
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
                          child: Text('$i5'),
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
                  if (i6 == 1) {
                    i6 = 0;
                    countMarkI -= 1;
                    localStorage.setPart3MarkI(countMarkI);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent();
                  } else {
                    i6 = 1;
                    countMarkI += 1;
                    localStorage.setPart3MarkI(countMarkI);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
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
                                .translate('part3_session_i6')),
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
                              child: Text('$i6'),
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
                  if (i7 == 1) {
                    i7 = 0;
                    countMarkIM -= 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent();
                  } else {
                    i7 = 1;
                    countMarkIM += 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
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
                                    .translate('part3_session_i7_bold'),
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
                          child: Text('$i7'),
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
                  if (i8 == 1) {
                    i8 = 0;
                    countMarkIM -= 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent();
                  } else {
                    i8 = 1;
                    countMarkIM += 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
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
                                    .translate('part3_session_i8_bold'),
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
                          child: Text('$i8'),
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
                  if (i9 == 1) {
                    i9 = 0;
                    countMarkIM -= 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent();
                  } else {
                    i9 = 1;
                    countMarkIM += 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
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
                                    .translate('part3_session_i9_bold'),
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
                          child: Text('$i9'),
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
                  if (i10 == 1) {
                    i10 = 0;
                    countMarkIM -= 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI -= 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
                    widget.notifyParent();
                  } else {
                    i10 = 1;
                    countMarkIM += 1;
                    localStorage.setPart3MarkIM(countMarkIM);

                    //total marks on top of checkbox
                    countSessionI += 1;
                    localStorage.setPart3MarkSessionI(countSessionI);
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
                                  .translate('part3_session_i10_bold'),
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
                          child: Text('$i10'),
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
                    value: sessionI,
                    onChanged: (bool value) {
                      setState(() {
                        sessionI = value;
                        setState(() {
                          if (value) {
                            i1 = 1;
                            i2 = 1;
                            i3 = 1;
                            i4 = 1;
                            i5 = 1;
                            i6 = 1;
                            i7 = 1;
                            i8 = 1;
                            i9 = 1;
                            i10 = 1;
                            countSessionI = 10;
                            countMarkIM = 4;
                            countMarkI = 6;
                            localStorage.setPart3MarkSessionI(countSessionI);
                            localStorage.setPart3MarkIM(countMarkIM);
                            localStorage.setPart3MarkI(countMarkI);
                            widget.notifyParent();
                          } else {
                            i1 = 0;
                            i2 = 0;
                            i3 = 0;
                            i4 = 0;
                            i5 = 0;
                            i6 = 0;
                            i7 = 0;
                            i8 = 0;
                            i9 = 0;
                            i10 = 0;
                            countSessionI = 0;
                            countMarkIM = 0;
                            countMarkI = 0;

                            localStorage.setPart3MarkSessionI(countSessionI);
                            localStorage.setPart3MarkIM(countMarkIM);
                            localStorage.setPart3MarkI(countMarkI);
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
                '$countSessionI/10',
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
