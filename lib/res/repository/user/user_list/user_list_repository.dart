import 'package:mvvm_login/data/network/network_api_services.dart';
import 'package:mvvm_login/res/app_url/app_url.dart';

class UserListRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return response;
  }
}