import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_login/views/user/userlist/widgets/user_card.dart';
import '../../../view_models/controllers/user/userlist/user_list_controller.dart';
import 'package:mvvm_login/res/components/custom_app_bar.dart';
import 'package:mvvm_login/utilis/loading_page.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserListViewModel controller = Get.isRegistered<UserListViewModel>()
        ? Get.find<UserListViewModel>()
        : Get.put(UserListViewModel());

    return Scaffold(
      appBar: const CustomAppBar(title: 'User List', showBackButton: false),
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
        child: Obx(() {
          if (controller.loading.value) {
            return const LoadingPage();
          }
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return UserCard(
                user: user,
                onTap: () => print('Card tapped: ${user.fullName}'),
                onButtonTap: () => print('Button tapped: ${user.fullName}'),
              );
            },
          );
        }),
      ),
    );
  }
}