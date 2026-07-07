import 'package:get/get.dart';
import 'package:mvvm_login/models/user/userList/user_list.dart';
import 'package:mvvm_login/res/repository/user/user_list/user_list_repository.dart';
import 'package:mvvm_login/utilis/utilis.dart';

class UserListViewModel extends GetxController {
  final _api = UserListRepository();

  RxBool loading = false.obs;
  RxList<UserList> users = <UserList>[].obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() {
    loading.value = true;
    errorMessage.value = '';

    _api.userListApi().then((value) {
      loading.value = false;

      final UserListResponse response = UserListResponse.fromJson(value);
      users.value = response.users;
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
      Utlis.toastMessage(error.toString());
    });
  }
}