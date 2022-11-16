import 'package:flutter/material.dart';
import 'package:jpj_qto/utils/local_storage.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final localStorage = LocalStorage();
  String firstName = '';
  String icNo = '';
  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  Future<void> loadInfo() async {
    firstName = (await localStorage.getName())!;
    icNo = (await localStorage.getMySikapId())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Card(
            color: Colors.yellow.shade50,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(Icons.account_circle_outlined),
                  Text(
                    firstName,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    icNo,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
