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
  String loginTime = '';
  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  Future<void> loadInfo() async {
    firstName = (await localStorage.getName())!;
    icNo = (await localStorage.getMySikapId())!;
    loginTime = ((await localStorage.getLoginTime())!).substring(0, 19);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.yellow.shade50,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.account_circle_outlined),
              Text(
                firstName,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.login,
                    size: 16,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(width: 8),
                  Text(loginTime),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
