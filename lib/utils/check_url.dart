import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../common_library/services/repository/auth_repository.dart';
import '../main.dart';

class CheckUrl {
  Box wsUrlBox = Hive.box('ws_url');
  late SnackBar snackBar;
  final AuthRepo authRepo = AuthRepo();

  Future<String> pingme() async {
    await Hive.box('ws_url').put('urlStatus', 1);

    if (await wsUrlBox.get('urlStatus') == 1 &&
        (await wsUrlBox.get('userDefinedUrl') != null &&
            await wsUrlBox.get('userDefinedUrl') != '')) {
      // snackBar = SnackBar(
      //   content: const Text('Connecting to Custom URL...'),
      //   duration: const Duration(seconds: 30),
      // );
      // WidgetsBinding.instance.addPostFrameCallback(
      //   (_) => navigatorKey.currentState?.showSnackBar(snackBar),
      // );

      var result = await authRepo.pingme(
          wsUrl: '${await wsUrlBox.get('userDefinedUrl')}/webapi',
          milliseconds: 3000);
      // navigatorKey.currentState?.hideCurrentSnackBar();
      if (result.isSuccess) {
        await wsUrlBox.put('wsUrl', await wsUrlBox.get('userDefinedUrl'));
        return 'Connection to Custom URL is successful.';
      }
    }
    await wsUrlBox.put('urlStatus', 2);
    if (await wsUrlBox.get('urlStatus') == 2) {
      // snackBar = SnackBar(
      //   content: const Text('Connecting to Default URL...'),
      //   duration: const Duration(seconds: 30),
      // );
      // WidgetsBinding.instance.addPostFrameCallback(
      //   (_) => navigatorKey.currentState?.showSnackBar(snackBar),
      // );

      var result = await authRepo.pingme(
          wsUrl: '${await wsUrlBox.get('defaultUrl')}/webapi',
          milliseconds: 3000);
      // navigatorKey.currentState?.hideCurrentSnackBar();
      if (result.isSuccess) {
        await wsUrlBox.put('wsUrl', await wsUrlBox.get('defaultUrl'));
        return 'Connection to Default URL is successful.';
      }
    }
    await wsUrlBox.put('urlStatus', 3);
    if (await wsUrlBox.get('urlStatus') == 3) {
      // snackBar = SnackBar(
      //   content: const Text('Connecting to CA URL...'),
      // );
      // navigatorKey.currentState?.showSnackBar(snackBar);
      var result = await authRepo.pingme();

      // navigatorKey.currentState?.hideCurrentSnackBar();
      if (result.isSuccess) {
        return 'Connection to CA URL is successful.';
      }
    }

    // navigatorKey.currentState?.hideCurrentSnackBar();
    return 'Connection to all URL is failed.';
  }
}
