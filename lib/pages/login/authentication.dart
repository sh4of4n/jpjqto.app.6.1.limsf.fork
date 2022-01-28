import 'package:auto_route/auto_route.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/common_library/services/model/provider_model.dart';
import 'package:jpj_qto/common_library/services/repository/auth_repository.dart';
import 'package:jpj_qto/utils/app_config.dart';

import 'package:jpj_qto/utils/device_info.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../router.gr.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final AuthRepo authRepo = AuthRepo();
  final AppConfig appConfig = AppConfig();
  final LocalStorage localStorage = LocalStorage();

  DeviceInfo deviceInfo = DeviceInfo();
  String deviceModel = '';
  String deviceVersion = '';
  String deviceId = '';

  @override
  void initState() {
    super.initState();

    _getWsUrl();
    _setLocale();
  }

  _getWsUrl() async {
    // final wsUrlBox = Hive.box('ws_url');

    // localStorage.reset();

    // String wsUrl = wsUrlBox.get('wsUrl');
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();

    // if (wsUrl == null) {
    await authRepo.getWsUrl(
      context: context,
      acctUid: caUid,
      acctPwd: caPwd,
      loginType: appConfig.wsCodeCrypt,
    );
    // }

    _checkExistingLogin();
  }

  _setLocale() async {
    String? locale = await localStorage.getLocale();

    if (locale == 'en') {
      Provider.of<LanguageModel>(context, listen: false).selectedLanguage(
          AppLocalizations.of(context)!.translate('english_lbl'));
    } else {
      Provider.of<LanguageModel>(context, listen: false).selectedLanguage(
          AppLocalizations.of(context)!.translate('malay_lbl'));
    }
  }

  _checkExistingLogin() async {
    String? userId = await localStorage.getUserId();
    String? groupId = await localStorage.getEnrolledGroupId();
    String? carNo = await localStorage.getCarNo();
    String? plateNo = await localStorage.getPlateNo();
    String? type = await localStorage.getType();
    if (userId != null && userId.isNotEmpty) {
      if (groupId != null &&
          groupId.isNotEmpty &&
          carNo != null &&
          carNo.isNotEmpty &&
          plateNo != null &&
          plateNo.isNotEmpty) {
        if (type == "RPK") {
          context.router.replace(HomePageRpk());
        } else {
          context.router.replace(Home());
        }
      } else {
        // context.router.replace(GetVehicleInfo());
        context.router.replace(HomeSelect());
      }
    } else {
      context.router.replace(Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(1440, 2960),
      orientation: Orientation.portrait,
    );

    return Scaffold(
      body: Container(),
    );
  }
}
