import 'package:jpj_qto/common_library/services/model/etesting_model.dart';

import '../../../services/api/networking.dart';
import '../../../services/response.dart';
import '../../../utils/app_config.dart';
import '../../../utils/local_storage.dart';

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
        'wsCodeCrypt=${appConfig.wsCodeCrypt}&caUid=$caUid&caPwd=$caPwd&diCode=$diCode&userId=$userId&diCode=$diCode&elementCode=$elementCode';

    var response = await networking.getData(
      path: 'GetRule?$path',
    );

    if (response.isSuccess && response.data != null) {
      RuleResponse ruleResponse = RuleResponse.fromJson(response.data);

      return Response(true, data: ruleResponse.rule);
    }

    return Response(false, message: response.message, data: []);
  }
}
