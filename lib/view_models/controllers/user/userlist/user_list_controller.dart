import 'package:flutter/cupertino.dart';
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
    if (loading.value) return; // prevent overlapping calls
    loading.value = true;
    errorMessage.value = '';

    _api.userListApi().then((value) {
      loading.value = false;
      final str = value.toString();
      for (var i = 0; i < str.length; i += 800) {
        print('full response is : ${str.substring(i, i + 800 > str.length ? str.length : i + 800)}');
      }
      final UserListResponse response = UserListResponse.fromJson(value);
      users.value = response.users;
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
      Utlis.toastMessage(error.toString());
    });
  }
}