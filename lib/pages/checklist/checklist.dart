import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:jpj_qto/router.gr.dart';

import '../../common_library/services/model/checklist_model.dart';
import '../../common_library/services/repository/checklist_repository.dart';
import '../../common_library/utils/app_localizations.dart';
import '../../common_library/utils/custom_dialog.dart';
import '../../common_library/utils/uppercase_formatter.dart';
import '../../utils/constants.dart';

class CheckListPage extends StatefulWidget {
  CheckListPage({Key? key}) : super(key: key);

  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  final checklistRepo = ChecklistRepo();
  Future? _checklistFuture;
  var checklist = [];
  List<JpjCheckListJson> checklistSkimArr = [];
  List<JpjCheckListJson> checklistLitarArr = [];
  List<JpjCheckListJson> checklistSystemArr = [];

  final _formKey = GlobalKey<FormBuilderState>();
  final customDialog = CustomDialog();

  Future getCheclkListSkim() async {
    return await checklistRepo.getCheckList(checkType: 'SKIM');
  }

  Future getCheclkListLitar() async {
    return await checklistRepo.getCheckList(checkType: 'LITAR');
  }

  Future getCheclkListSystem() async {
    return await checklistRepo.getCheckList(checkType: 'SISTEM');
  }

  Future updateJpjCheckListSkim(requestSkim) async {
    var a = checklistRepo.updateJpjCheckListSkim(
        checkListJson: jsonEncode(requestSkim.toJson()),
        plateNo: _formKey.currentState?.fields['plateNo']!.value);
    return a;
  }

  Future updateJpjCheckListLitar(requestLitar) async {
    var a = checklistRepo.updateJpjCheckListLitar(
      checkListJson: jsonEncode(requestLitar.toJson()),
    );
    return a;
  }

  Future updateJpjCheckListSistem(requestSystem) async {
    var a = checklistRepo.updateJpjCheckListSistem(
      checkListJson: jsonEncode(requestSystem.toJson()),
    );
    return a;
  }

  void updateJpjCheckList() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      checklistSkimArr = [];
      checklistLitarArr = [];
      checklistSystemArr = [];

      for (var element in checklist[0].data) {
        if (element.mandatory == 'true' &&
            (element.isCheck == null || element.isCheck == false)) {
          customDialog.show(
            context: context,
            content: AppLocalizations.of(context)!
                .translate('select_all_mandatory_field'),
            type: DialogType.INFO,
          );
          return;
        }
        checklistSkimArr.add(JpjCheckListJson(
          checkCode: element.checkCode,
          status: (element.isCheck != null && element.isCheck) ? '1' : '0',
          remark: '',
        ));
      }

      for (var element in checklist[1].data) {
        if (element.mandatory == 'true' &&
            (element.isCheck == null || element.isCheck == false)) {
          customDialog.show(
            context: context,
            content: 'Please select all mandatory fields',
            type: DialogType.INFO,
          );
          return;
        }
        checklistLitarArr.add(JpjCheckListJson(
          checkCode: element.checkCode,
          status: (element.isCheck != null && element.isCheck) ? '1' : '0',
          remark: '',
        ));
      }

      for (var element in checklist[2].data) {
        if (element.mandatory == 'true' &&
            (element.isCheck == null || element.isCheck == false)) {
          customDialog.show(
            context: context,
            content: 'Please select all mandatory fields',
            type: DialogType.INFO,
          );
          return;
        }
        checklistSystemArr.add(JpjCheckListJson(
          checkCode: element.checkCode,
          status: (element.isCheck != null && element.isCheck) ? '1' : '0',
          remark: '',
        ));
      }

      EasyLoading.show(status: 'Updating...');

      JpjCheckListRequest requestSkim = JpjCheckListRequest(
        jpjCheckList: checklistSkimArr,
      );

      JpjCheckListRequest requestLitar = JpjCheckListRequest(
        jpjCheckList: checklistLitarArr,
      );

      JpjCheckListRequest requestSystem = JpjCheckListRequest(
        jpjCheckList: checklistSystemArr,
      );

      var updateFuture = Future.wait([
        updateJpjCheckListSkim(requestSkim),
        updateJpjCheckListLitar(requestLitar),
        updateJpjCheckListSistem(requestSystem),
      ]);

      try {
        var updateResult = await updateFuture;
        for (var element in updateResult) {
          if (!element.isSuccess) {
            await EasyLoading.dismiss();
            const snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text('Something went wrong'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            return;
          }
        }
        await EasyLoading.dismiss();
        customDialog.show(
            context: context,
            content: AppLocalizations.of(context)!
                .translate('checklist_updated_successfully'),
            type: DialogType.SUCCESS,
            barrierDismissable: false,
            onPressed: () async {
              context.router
                  .popUntil((route) => route.settings.name == 'HomeSelect');
            });
      } catch (e) {
        await EasyLoading.dismiss();
      }
    }
  }

  Future<void> storeChecklist() async {
    checklist = await _checklistFuture;
  }

  @override
  void initState() {
    super.initState();
    _checklistFuture = Future.wait([
      getCheclkListSkim(),
      getCheclkListLitar(),
      getCheclkListSystem(),
    ]);
    storeChecklist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        title: Text(AppLocalizations.of(context)!.translate('checklist')),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(ChecklistResultRoute());
            },
            icon: Icon(
              Icons.history,
            ),
          ),
          IconButton(
            onPressed: () {
              updateJpjCheckList();
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _checklistFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FormBuilder(
                      key: _formKey,
                      child: FormBuilderTextField(
                        name: 'plateNo',
                        inputFormatters: [UpperCaseTextFormatter()],
                        decoration:
                            const InputDecoration(labelText: 'Plate No.'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                    ),
                  ),
                  ExpandableNotifier(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: <Widget>[
                            ScrollOnExpand(
                              scrollOnExpand: true,
                              scrollOnCollapse: false,
                              child: ExpandablePanel(
                                theme: const ExpandableThemeData(
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  tapBodyToCollapse: true,
                                ),
                                header: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "SKIM",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                collapsed: SizedBox(),
                                expanded: ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    for (var item in checklist[0].data)
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: CheckboxListTile(
                                          title: Text(item.checkDesc),
                                          value: item.isCheck ?? false,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              item.isCheck = value;
                                            });
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                                builder: (_, collapsed, expanded) {
                                  return Expandable(
                                    collapsed: collapsed,
                                    expanded: expanded,
                                    theme: const ExpandableThemeData(
                                        crossFadePoint: 0),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ExpandableNotifier(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: <Widget>[
                            ScrollOnExpand(
                              scrollOnExpand: true,
                              scrollOnCollapse: false,
                              child: ExpandablePanel(
                                theme: const ExpandableThemeData(
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  tapBodyToCollapse: true,
                                ),
                                header: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "LITAR",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                collapsed: SizedBox(),
                                expanded: ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    for (var item in checklist[1].data)
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: CheckboxListTile(
                                          title: Text(item.checkDesc),
                                          value: item.isCheck ?? false,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              item.isCheck = value;
                                            });
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                                builder: (_, collapsed, expanded) {
                                  return Expandable(
                                    collapsed: collapsed,
                                    expanded: expanded,
                                    theme: const ExpandableThemeData(
                                        crossFadePoint: 0),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ExpandableNotifier(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: <Widget>[
                            ScrollOnExpand(
                              scrollOnExpand: true,
                              scrollOnCollapse: false,
                              child: ExpandablePanel(
                                theme: const ExpandableThemeData(
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  tapBodyToCollapse: true,
                                ),
                                header: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "SISTEM",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                collapsed: SizedBox(),
                                expanded: ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    for (var item in checklist[2].data)
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: CheckboxListTile(
                                          title: Text(item.checkDesc),
                                          value: item.isCheck ?? false,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              item.isCheck = value;
                                            });
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                                builder: (_, collapsed, expanded) {
                                  return Expandable(
                                    collapsed: collapsed,
                                    expanded: expanded,
                                    theme: const ExpandableThemeData(
                                        crossFadePoint: 0),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
