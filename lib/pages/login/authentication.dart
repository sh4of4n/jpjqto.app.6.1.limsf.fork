import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import 'package:jpj_qto/common_library/utils/app_localizations.dart';
import 'package:jpj_qto/common_library/services/model/provider_model.dart';
import 'package:jpj_qto/common_library/services/repository/auth_repository.dart';
import 'package:jpj_qto/router.dart';
import 'package:jpj_qto/utils/app_config.dart';

import 'package:jpj_qto/utils/device_info.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common_library/services/repository/etesting_repository.dart';
import '../../common_library/services/response.dart';
import '../../main.dart';
import '../../router.gr.dart';
import '../../utils/check_url.dart';
import '../../utils/constants.dart';

@RoutePage(name: 'Authentication')
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

  Timer? timer;
  final etestingRepo = EtestingRepo();
  Box wsUrlBox = Hive.box('ws_url');
  late SnackBar snackBar;
  CheckUrl checkUrl = CheckUrl();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      checkUserLoginStatus();
    });
    // _getWsUrl();
    _setLocale();
    checkUrl.checkUrl('', '').then((value) => _checkExistingLogin());
    // checkUrl.pingme().then((value) {
    //   snackBar = SnackBar(
    //     content: Text(value),
    //   );
    //   navigatorKey.currentState?.showSnackBar(snackBar);
    // });
  }

  // Future<String> pingme() async {
  //   if (await wsUrlBox.get('urlStatus') == 1 &&
  //       (await wsUrlBox.get('userDefinedUrl') != null &&
  //           await wsUrlBox.get('userDefinedUrl') != '')) {
  //     snackBar = SnackBar(
  //       content: const Text('Connecting to Custom URL...'),
  //       duration: const Duration(seconds: 30),
  //     );
  //     WidgetsBinding.instance.addPostFrameCallback(
  //       (_) => navigatorKey.currentState?.showSnackBar(snackBar),
  //     );

  //     var result = await authRepo.pingme(
  //         wsUrl: await wsUrlBox.get('userDefinedUrl'), milliseconds: 3000);
  //     navigatorKey.currentState?.hideCurrentSnackBar();
  //     if (result.isSuccess) {
  //       return 'Connection to Custom URL is successful.';
  //     }
  //   }
  //   await wsUrlBox.put('urlStatus', 2);
  //   if (await wsUrlBox.get('urlStatus') == 2) {
  //     snackBar = SnackBar(
  //       content: const Text('Connecting to Default URL...'),
  //       duration: const Duration(seconds: 30),
  //     );
  //     WidgetsBinding.instance.addPostFrameCallback(
  //       (_) => navigatorKey.currentState?.showSnackBar(snackBar),
  //     );

  //     var result = await authRepo.pingme(
  //         wsUrl: await wsUrlBox.get('defaultUrl'), milliseconds: 3000);
  //     navigatorKey.currentState?.hideCurrentSnackBar();
  //     if (result.isSuccess) {
  //       return 'Connection to Default URL is successful.';
  //     }
  //   }
  //   await wsUrlBox.put('urlStatus', 3);
  //   if (await wsUrlBox.get('urlStatus') == 3) {
  //     snackBar = SnackBar(
  //       content: const Text('Connecting to CA URL...'),
  //     );
  //     navigatorKey.currentState?.showSnackBar(snackBar);
  //     var result = await authRepo.pingme();

  //     navigatorKey.currentState?.hideCurrentSnackBar();
  //     if (result.isSuccess) {
  //       return 'Connection to CA URL is successful.';
  //     }
  //   }

  //   navigatorKey.currentState?.hideCurrentSnackBar();
  //   return 'Connection to all URL is failed.';
  // }

  checkUserLoginStatus() async {
    String? userId = await localStorage.getUserId();
    if (userId != null && userId.isNotEmpty) {
      Response result = await etestingRepo.checkUserLoginStatus();
      if (result.isSuccess) {
        if (result.data[0].result == 'false') {
          const snackBar = SnackBar(
            content: Text('Your session has expired. Please login again.'),
            behavior: SnackBarBehavior.floating,
          );
          navigatorKey.currentState!.showSnackBar(snackBar);
          await localStorage.reset();
          await getIt<AppRouter>().replaceAll([const Login()]);
        }
      }
    }
  }

  _getWsUrl() async {
    // final wsUrlBox = Hive.box('ws_url');

    // localStorage.reset();

    // String wsUrl = wsUrlBox.get('wsUrl');
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();

    // if (wsUrl == null) {
    await authRepo.getWsUrl(
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
    if (mounted) {
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
          context.router.replace(HomeSelect());
        }
      } else {
        context.router.replace(Login());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(1440, 2960),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.amber.shade50,
            Colors.amber.shade100,
            Colors.amber.shade200,
            Colors.amber.shade300,
            ColorConstant.primaryColor,
          ],
          stops: [0.2, 0.4, 0.6, 0.7, 1],
          radius: 0.7,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagesConstant().logo,
                width: 1000.w,
                height: 600.h,
              ),
              const SizedBox(
                height: 50,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
