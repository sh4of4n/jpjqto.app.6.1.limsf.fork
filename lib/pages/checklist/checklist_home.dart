import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChecklistHome extends StatelessWidget {
  const ChecklistHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Checklist'),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Checklist')),
            ElevatedButton(onPressed: () {}, child: Text('Checklist')),
            ElevatedButton(onPressed: () {}, child: Text('Checklist')),
          ],
        ));
  }
}
