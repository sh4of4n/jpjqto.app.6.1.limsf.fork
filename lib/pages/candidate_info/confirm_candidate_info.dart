import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpj_qto/common_library/services/repository/epandu_repository.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/common_library/utils/custom_button.dart';
import 'package:jpj_qto/common_library/utils/custom_dialog.dart';
import 'package:jpj_qto/common_library/utils/loading_model.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/local_storage.dart';

import '../../router.gr.dart';

class ConfirmCandidateInfo extends StatefulWidget {
  final String part3Type;
  final String nric;
  final String name;
  final String qNo;
  final String groupId;
  final String testDate;
  final String testCode;

  ConfirmCandidateInfo({
    @required this.part3Type,
    @required this.nric,
    @required this.name,
    @required this.qNo,
    @required this.groupId,
    @required this.testDate,
    @required this.testCode,
  });

  @override
  _ConfirmCandidateInfoState createState() => _ConfirmCandidateInfoState();
}

class _ConfirmCandidateInfoState extends State<ConfirmCandidateInfo> {
  final localStorage = LocalStorage();
  final epanduRepo = EpanduRepo();
  final customDialog = CustomDialog();
  bool isLoading = false;
  String vehNo = '';

  /* @override
  void initState() {
    super.initState();

    callPart3JpjTest();
  }

  Future<void> callPart3JpjTest() async {
    setState(() {
      isLoading = true;
    });

    vehNo = await localStorage.getPlateNo();

    // ExtendedNavigator.of(context).push(Routes.rpkPartIII,
    //     arguments: RpkPartIIIArguments(
    //       qNo: widget.qNo,
    //       nric: widget.nric,
    //       name: widget.name,
    //       testDate: widget.testDate,
    //       groupId: widget.groupId,
    //       testCode: widget.testCode,
    //       vehNo: vehNo,
    //     ));

    // ExtendedNavigator.of(context).push(Routes.jrPartIII,
    //     arguments: JrPartIIIArguments(
    //       qNo: widget.qNo,
    //       nric: widget.nric,
    //       name: widget.name,
    //       testDate: widget.testDate,
    //       groupId: widget.groupId,
    //       testCode: widget.testCode,
    //       vehNo: vehNo,
    //     ));

    var result = await epanduRepo.callPart3JpjTest(
      vehNo: vehNo,
      part3Type: widget.part3Type,
      groupId: widget.groupId,
      testCode: widget.testCode,
      icNo: widget.nric,
    );

    if (result.isSuccess) {
    } else {
      customDialog.show(
        context: context,
        content: result.message,
        type: DialogType.WARNING,
      );
    }

    setState(() {
      isLoading = false;
    });
  } */

  Future<bool> _onWillPop() async {
    return CustomDialog().show(
      context: context,
      title: Text(AppLocalizations.of(context).translate('warning_title')),
      content: AppLocalizations.of(context).translate('confirm_exit_desc'),
      customActions: <Widget>[
        TextButton(
          child: Text(AppLocalizations.of(context).translate('yes_lbl')),
          onPressed: () {
            ExtendedNavigator.of(context).pop();
            cancelCallPart3JpjTest();
          },
        ),
        TextButton(
          child: Text(AppLocalizations.of(context).translate('no_lbl')),
          onPressed: () {
            ExtendedNavigator.of(context).pop();
          },
        ),
      ],
      type: DialogType.GENERAL,
    );
  }

  Future<void> cancelCallPart3JpjTest() async {
    setState(() {
      isLoading = true;
    });

    var result = await epanduRepo.cancelCallPart3JpjTest(
      part3Type: widget.part3Type,
      groupId: widget.groupId,
      testCode: widget.testCode,
      icNo: widget.nric,
    );

    if (result.isSuccess) {
      ExtendedNavigator.of(context).pop();
    } else {
      customDialog.show(
        context: context,
        content: result.message,
        type: DialogType.WARNING,
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  startTest() async {
    vehNo = await localStorage.getPlateNo();

    if (widget.part3Type == 'RPK')
      ExtendedNavigator.of(context).push(Routes.rpkPartIII,
          arguments: RpkPartIIIArguments(
            qNo: widget.qNo,
            nric: widget.nric,
            name: widget.name,
            testDate: widget.testDate,
            groupId: widget.groupId,
            testCode: widget.testCode,
            vehNo: vehNo,
          ));
    else
      ExtendedNavigator.of(context).push(Routes.jrPartIII,
          arguments: JrPartIIIArguments(
            qNo: widget.qNo,
            nric: widget.nric,
            name: widget.name,
            testDate: widget.testDate,
            groupId: widget.groupId,
            testCode: widget.testCode,
            vehNo: vehNo,
          ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(title: Text('Maklumat Calon')),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Text('Q-NO', style: TextStyle(fontSize: 100.sp)),
                  Text(
                    widget.qNo,
                    style: TextStyle(fontSize: 200.sp),
                  ),
                  Text(widget.nric, style: TextStyle(fontSize: 80.sp)),
                  SizedBox(height: 20.h),
                  Text(widget.name, style: TextStyle(fontSize: 80.sp)),
                  SizedBox(height: 30.h),
                  Text(
                    widget.groupId,
                    style: TextStyle(fontSize: 250.sp),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(widget.testDate.substring(0, 10),
                          style: TextStyle(fontSize: 60.sp)),
                      Text(widget.testDate.substring(11, 16),
                          style: TextStyle(fontSize: 60.sp)),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Text(widget.testCode, style: TextStyle(fontSize: 80.sp)),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        onPressed: _onWillPop,
                        buttonColor: Color(0xffdd0e0e),
                        title: AppLocalizations.of(context)
                            .translate('cancel_btn'),
                      ),
                      CustomButton(
                        onPressed: startTest,
                        buttonColor: Color(0xffdd0e0e),
                        title: AppLocalizations.of(context)
                            .translate('start_test'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            LoadingModel(
              isVisible: isLoading,
              color: ColorConstant.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
