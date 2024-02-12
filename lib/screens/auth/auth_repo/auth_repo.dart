import 'package:shoppixa/network/api_repo_imp.dart';
import 'package:shoppixa/network/urls/app_urls.dart';
import 'package:shoppixa/utils/logger.dart';

import '../../../network/network_model/api_return_model.dart';

class AuthenticationRepo {
  final repo = ApiRepoImp();

  Future<ApiReturnModel?> registerApiCall(Map<String, dynamic> registerReq) async {
    ApiReturnModel? data = await repo.callApi(
        tag: 'tag',
        uri: AppUrl().register(),
        bodyData: BodyData(
          bodyTypeStatus: BodyTypeStatus.raw,
          value: registerReq,
        ),
        method: Method.get);
    AppLog.i("message ${data?.responseString}");
    return data;
  }
}
