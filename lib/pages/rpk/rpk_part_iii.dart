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

  @override
  void initState() {
    super.initState();

    updatePart3JpjTestStart();
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
          title: Icon(Icons.error_outline),
          content: result.message,
          customActions: [
            FlatButton(
              onPressed: () => ExtendedNavigator.of(context).popUntil(
                ModalRoute.withName(Routes.confirmCandidateInfo),
              ),
              child: Text('Ok'),
            ),
          ],
          type: DialogType.GENERAL);
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

    // print(resultJson);

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
          onPressed: () {
            Provider.of<RpkSessionModel>(context, listen: false).reset();

            ExtendedNavigator.of(context).popUntil(
              ModalRoute.withName(Routes.home),
            );
          },
          content: AppLocalizations.of(context).translate('test_submitted'),
          type: DialogType.SUCCESS);
    } else {
      customDialog.show(
          context: context, content: result.message, type: DialogType.WARNING);
    }

    setState(() {
      isVisible = false;
    });
  }

  Future<bool> _onWillPop() async {
    // return CustomDialog().show(
    //   context: context,
    //   title: Text(AppLocalizations.of(context).translate('warning_title')),
    //   content: AppLocalizations.of(context).translate('confirm_exit_desc'),
    //   customActions: <Widget>[
    //     TextButton(
    //       child: Text(AppLocalizations.of(context).translate('yes_lbl')),
    //       onPressed: () {
    //         Provider.of<RpkSessionModel>(context, listen: false).reset();

    //         ExtendedNavigator.of(context).popUntil(
    //           ModalRoute.withName(Routes.home),
    //         );
    //       },
    //     ),
    //     TextButton(
    //       child: Text(AppLocalizations.of(context).translate('no_lbl')),
    //       onPressed: () {
    //         ExtendedNavigator.of(context).pop();
    //       },
    //     ),
    //   ],
    //   type: DialogType.GENERAL,
    // );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    int mark = context.watch<RpkSessionModel>().mark;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                                Text(widget.testDate.substring(0, 10),
                                    style: textStyle),
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
                            child: Text('R',
                                style: TextStyle(color: Colors.black))),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: mark.toString(),
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: '/24',
                                  style: TextStyle(color: Colors.black)),
                            ]))),
                        Center(
                            child: Text('-',
                                style: TextStyle(color: Colors.black))),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(100),
                  ),
                  Container(
                    child: RaisedButton(
                      onPressed: updatePart3JpjTestResult,
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
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
