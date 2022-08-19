import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../common_library/services/repository/checklist_repository.dart';

class ChecklistResultPage extends StatefulWidget {
  ChecklistResultPage({Key? key}) : super(key: key);

  @override
  State<ChecklistResultPage> createState() => _ChecklistResultPageState();
}

class _ChecklistResultPageState extends State<ChecklistResultPage> {
  Future? _checklistFuture;
  final checklistRepo = ChecklistRepo();
  var checklist = [];

  Future getCheckListSkim() async {
    return await checklistRepo.getJpjCheckListSkim(plateNo: 'abc123');
  }

  Future getCheckListLitar() async {
    return await checklistRepo.getJpjCheckListLitar(plateNo: 'abc123');
  }

  Future getCheckListSystem() async {
    return await checklistRepo.getJpjCheckListSistem(plateNo: 'abc123');
  }

  @override
  void initState() {
    super.initState();
    _checklistFuture = Future.wait([
      getCheckListSkim(),
      getCheckListLitar(),
      getCheckListSystem(),
    ]);
    storeChecklist();
  }

  Future<void> storeChecklist() async {
    checklist = await _checklistFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist Result'),
      ),
      body: FutureBuilder(
        future: _checklistFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16.0,
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
                                          value: item.status == 'true'
                                              ? true
                                              : false,
                                          onChanged: (bool? value) {},
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
                                          value: item.status == 'true'
                                              ? true
                                              : false,
                                          onChanged: (bool? value) {},
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
                                          value: item.status == 'true'
                                              ? true
                                              : false,
                                          onChanged: (bool? value) {},
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
