import 'package:shoppixa/network/api_repo_imp.dart';
import 'package:shoppixa/utils/logger.dart';

import '../../../network/api_return_model.dart';

class AuthenticationRepo {
  final repo = ApiRepoImp();

  Future<void> call() async {
    ApiReturnModel? data = await repo.callApi(
        tag: 'tag',
        uri: 'https://auth-stg.onrender.com/api/v2/user-details',
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA3NDk5MDA4LCJpYXQiOjE3MDc0MTI2MDgsImp0aSI6IjJmNDU0Y2YxNTk0MTQ1ZmI5OTg4Mzc1Y2JlNmZhNGE2IiwidXNlcl9pZCI6ImZjZmNmNTFmLTQzOTQtNGMzNS1hNzAwLWE0YWRmZjE2NmVkMyJ9.Z4H0q7FaHJ37BQZkmlaiKS9qZL-JFtQxTFg9gqlYGGQ'
        },
        method: Method.get);
    AppLog.i("message ${data?.responseString}");
  }
}
