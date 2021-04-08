import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/pages/eTestingSolution/custom_expansion_tile.dart'
    as custom;

class SessionI extends StatefulWidget {
  final Function() notifyParent;
  SessionI({Key key, this.notifyParent}) : super(key: key);

  @override
  _SessionIState createState() => _SessionIState();
}

class _SessionIState extends State<SessionI> {
  final localStorage = LocalStorage();

  int j1 = 0, j2 = 0, j3 = 0, j4 = 0, j5 = 0;
  int countMarkJM = 0;

  bool sessionH = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        custom.ExpansionTile(
          headerBackgroundColor: ColorConstant.primaryColor,
          title: Text(
            AppLocalizations.of(context).translate('jr_session_i'),
            style:
                (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                  if (j1 == 1) {
                    j1 = 0;
                    countMarkJM -= 1;
                    localStorage.setPart3MarkJM(countMarkJM);
                    widget.notifyParent();
                  } else if (j1 == 0) {
                    j1 = 1;
                    countMarkJM += 1;
                    localStorage.setPart3MarkJM(countMarkJM);

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
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('part3_session_j1_bold'),
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
                          child: Text('$j1'),
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
                  if (j2 == 1) {
                    j2 = 0;
                    countMarkJM -= 1;
                    localStorage.setPart3MarkJM(countMarkJM);

                    widget.notifyParent();
                  } else if (j2 == 0) {
                    j2 = 1;
                    countMarkJM += 1;
                    localStorage.setPart3MarkJM(countMarkJM);
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
                                  .translate('part3_session_j2_bold'),
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
                          child: Text('$j2'),
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
                  if (j3 == 1) {
                    j3 = 0;
                    countMarkJM -= 1;
                    localStorage.setPart3MarkJM(countMarkJM);

                    widget.notifyParent();
                  } else if (j3 == 0) {
                    j3 = 1;
                    countMarkJM += 1;
                    localStorage.setPart3MarkJM(countMarkJM);

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
                                  .translate('part3_session_j3_bold'),
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
                          child: Text('$j3'),
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
                  if (j4 == 1) {
                    j4 = 0;
                    countMarkJM -= 1;
                    localStorage.setPart3MarkJM(countMarkJM);
                    widget.notifyParent();
                  } else if (j4 == 0) {
                    j4 = 1;
                    countMarkJM += 1;
                    localStorage.setPart3MarkJM(countMarkJM);

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
                                  .translate('part3_session_j4_bold'),
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
                          child: Text('$j4'),
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
            child: Transform.scale(
              scale: 1.3,
              child: Checkbox(
                checkColor: Colors.black,
                activeColor: Colors.white,
                value: sessionH,
                onChanged: (bool value) {
                  setState(() {
                    sessionH = value;
                    setState(() {
                      if (value) {
                        j1 = 1;
                        j2 = 1;
                        j3 = 1;
                        j4 = 1;
                        countMarkJM = 4;
                        localStorage.setPart3MarkJM(countMarkJM);
                        widget.notifyParent();
                      } else {
                        j1 = 0;
                        j2 = 0;
                        j3 = 0;
                        j4 = 0;
                        countMarkJM = 0;
                        localStorage.setPart3MarkJM(countMarkJM);
                        widget.notifyParent();
                      }
                    });
                  });
                },
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 40, top: 5),
            child: Container(
              child: Text(
                '$countMarkJM/4',
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
