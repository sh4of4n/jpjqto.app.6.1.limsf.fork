import 'dart:convert';

import 'package:jpj_qto/common_library/services/model/epandu_model.dart';
import 'package:jpj_qto/common_library/services/model/etesting_model.dart';

import '../../../utils/app_config.dart';
import '../../../utils/local_storage.dart';
import '../networking.dart';
import '../response.dart';

class EtestingRepo {
  final localStorage = LocalStorage();
  final appConfig = AppConfig();
  final networking = Networking();

  Future<Response> getRule({
    required elementCode,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&userId=$userId&diCode=$diCode&elementCode=$elementCode';

    var response = await networking.getData(
      path: 'GetRule?$path',
    );

    if (response.isSuccess && response.data != null) {
      RuleResponse ruleResponse = RuleResponse.fromJson(response.data);

      return Response(true, data: ruleResponse.rule);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> updateMySikapStatusOut() async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();

    ResultRequest params = ResultRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      userId: userId,
      permitCode: diCode,
    );

    String body = jsonEncode(params);
    String api = 'UpdateMySikapStatusOut';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    // Success
    if (response.isSuccess &&
        response.data != null &&
        response.data.isNotEmpty) {
      await localStorage.reset();
      return Response(true, data: response.data);
    }
    return Response(false, message: response.message, data: []);
  }

  Future<Response> qtoUjianLogout() async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? appVersion = await localStorage.getAppVersion();
    String? mySikapId = await localStorage.getMySikapId();

    QtoUjianLogoutRequest params = QtoUjianLogoutRequest(
      wsCodeCrypt: appConfig.wsCodeCrypt,
      caUid: caUid,
      caPwd: caPwd,
      appId: appConfig.appId,
      appVersion: appVersion,
      mySikapId: mySikapId,
      permitCode: diCode,
    );

    String body = jsonEncode(params);
    String api = 'QtoUjianLogout';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response =
        await networking.postData(api: api, body: body, headers: headers);

    // Success
    if (response.isSuccess) {
      await localStorage.reset();
      // QtoUjianLogoutResponse ruleResponse =
      //     QtoUjianLogoutResponse.fromJson(response.data);

      return Response(true, data: response.data);
    }
    return Response(false, message: response.message, data: []);
  }

  Future<Response> getOwnerIdCategoryList() async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();

    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd';

    var response = await networking.getData(
      path: 'GetOwnerIdCategoryList?$path',
    );

    if (response.isSuccess && response.data != null) {
      OwnerIdCategoryResponse ruleResponse =
          OwnerIdCategoryResponse.fromJson(response.data);

      return Response(true, data: ruleResponse.ownerIdCategoryList);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> getMySikapVehicleListByStatus(
      {required String status}) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&status=$status';

    var response = await networking.getData(
      path: 'GetMySikapVehicleListByStatus?$path',
    );

    if (response.isSuccess && response.data != null) {
      MySikapVehicleListResponse ruleResponse =
          MySikapVehicleListResponse.fromJson(response.data);

      return Response(true, data: ruleResponse.mysikapVehicle);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> getMySikapVehicleListByStatusPart({
    required String status,
    required String part,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&status=$status&part=$part';
    var response = await networking.getData(
      path: 'GetMySikapVehicleListByStatusPart?$path',
    );
    if (response.isSuccess && response.data != null) {
      MySikapVehicleListResponse ruleResponse =
          MySikapVehicleListResponse.fromJson(response.data);
      return Response(true, data: ruleResponse.mysikapVehicle);
    }
    return Response(false, message: response.message, data: []);
  }

  Future<Response> isVehicleAvailable({
    required String plateNo,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&plateNo=$plateNo';

    var response = await networking.getData(
      path: 'IsVehicleAvailable?$path',
    );

    if (response.isSuccess && response.data != null) {
      return Response(true, data: response.data);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> isVehicleAvailableByUserId({
    required String plateNo,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&plateNo=$plateNo&userId=$userId';

    var response = await networking.getData(
      path: 'IsVehicleAvailableByUserId?$path',
    );

    if (response.isSuccess && response.data != null) {
      return Response(true, data: response.data);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> isCurrentCallingCalon({
    required String plateNo,
    required String partType,
    required String nricNo,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&plateNo=$plateNo&partType=$partType&nricNo=$nricNo';

    var response = await networking.getData(
      path: 'IsCurrentCallingCalon?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetPart3AvailableToCallJpjTestListResponse
          getPart3AvailableToCallJpjTestListResponse =
          GetPart3AvailableToCallJpjTestListResponse.fromJson(response.data);
      return Response(true,
          data: getPart3AvailableToCallJpjTestListResponse.jpjTestTrn);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> isCurrentInProgressCalon({
    required String plateNo,
    required String partType,
    required String nricNo,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&plateNo=$plateNo&partType=$partType&nricNo=$nricNo';

    var response = await networking.getData(
      path: 'IsCurrentInProgressCalon?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetPart3AvailableToCallJpjTestListResponse
          getPart3AvailableToCallJpjTestListResponse =
          GetPart3AvailableToCallJpjTestListResponse.fromJson(response.data);
      return Response(true,
          data: getPart3AvailableToCallJpjTestListResponse.jpjTestTrn);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> qtiUjianLoginBhg2({
    required String licenseClass,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? appVersion = await localStorage.getAppVersion();
    String? mySikapId = await localStorage.getMySikapId();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&appId=${appConfig.appId}&appVersion=$appVersion&mySikapId=$mySikapId&licenseClass=$licenseClass&permitCode=$diCode';

    var response = await networking.getData(
      path: 'QtiUjianLoginBhg2?$path',
    );

    if (response.isSuccess && response.data != null) {
      return Response(true, data: response.data);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> qtiUjianLoginBhg3({
    required String licenseClass,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? appVersion = await localStorage.getAppVersion();
    String? mySikapId = await localStorage.getMySikapId();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&appId=${appConfig.appId}&appVersion=$appVersion&mySikapId=$mySikapId&licenseClass=$licenseClass&permitCode=$diCode';

    var response = await networking.getData(
      path: 'QtiUjianLoginBhg3?$path',
    );

    if (response.isSuccess && response.data != null) {
      return Response(true, data: response.data);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response<List<QtoUjianLoginResult>>> qtoUjianLogin() async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? appVersion = await localStorage.getAppVersion();
    String? mySikapId = await localStorage.getMySikapId();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&appId=${appConfig.appId}&appVersion=$appVersion&mySikapId=$mySikapId&permitCode=$diCode';

    var response = await networking.getData(
      path: 'QtoUjianLogin?$path',
    );

    if (response.isSuccess && response.data != null) {
      QtoUjianLoginResponse ruleResponse =
          QtoUjianLoginResponse.fromJson(response.data);
      return Response(true, data: ruleResponse.result);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response<List<Result2>>> getUserIdByMySikapId() async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? mySikapId = await localStorage.getMySikapId();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&appId=${appConfig.appId}&mySikapId=$mySikapId&permitCode=$diCode';

    var response = await networking.getData(
      path: 'GetUserIdByMySikapId?$path',
    );

    if (response.isSuccess && response.data != null) {
      GetUserIdByMySikapIdResult ruleResponse =
          GetUserIdByMySikapIdResult.fromJson(response.data);
      return Response(true, data: ruleResponse.result);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> checkUserLoginStatus() async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? mySikapId = await localStorage.getMySikapId();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&appId=${appConfig.appId}&mySikapId=$mySikapId&permitCode=$diCode';

    var response = await networking.getData(
      path: 'CheckUserLoginStatus?$path',
    );

    if (response.isSuccess && response.data != null) {
      CheckUserLoginStatusResponse ruleResponse =
          CheckUserLoginStatusResponse.fromJson(response.data);
      return Response(true, data: ruleResponse.result);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response> decryptQrcode({
    required String qrcodeJson,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String? userId = await localStorage.getUserId();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&&userId=$userId&diCode=$diCode&qrcodeJson=${Uri.encodeComponent(qrcodeJson)}';

    var response = await networking.getData(
      path: 'DecryptQrcode?$path',
    );

    if (response.isSuccess && response.data != null) {
      DecryptQrcodeResponse ruleResponse =
          DecryptQrcodeResponse.fromJson(response.data);
      return Response(true, data: ruleResponse.table1);
    }

    return Response(false, message: response.message, data: []);
  }

  Future<Response<String>> isSkipFingerPrint({
    required String cardNo,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&cardNo=$cardNo&courseCode=QTI';

    var response = await networking.getData(
      path: 'IsSkipFingerPrint?$path',
    );

    if (response.isSuccess && response.data != null) {
      return Response(true, data: response.data);
    }

    return Response(false, message: response.message, data: 'False');
  }

  Future<Response<String?>> getFingerPrintByCardNo({
    required String cardNo,
  }) async {
    String? caUid = await localStorage.getCaUid();
    String? caPwd = await localStorage.getCaPwd();
    String? diCode = await localStorage.getMerchantDbCode();
    String path =
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&cardNo=$cardNo';

    var response = await networking.getData(
      path: 'GetFingerPrintByCardNo?$path',
    );

    if (response.isSuccess && response.data != null) {
      return Response(true, data: response.data);
    }

    return Response(false, message: response.message, data: '');
  }
}
