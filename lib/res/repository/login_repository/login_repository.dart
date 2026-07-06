import 'package:mvvm_login/data/network/network_api_services.dart';
import 'package:mvvm_login/res/app_url/app_url.dart';


class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic reponse = await _apiService.postApi(data, AppUrl.loginApi);
    return reponse;
  }
}
