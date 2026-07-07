import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_login/views/user/userlist/widgets/user_card.dart';
import '../../../view_models/controllers/user/userlist/user_list_controller.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserListViewModel controller = Get.put(UserListViewModel());

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
        child: Obx(() {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              return UserCard(user: controller.users[index]);
            },
          );
        }),
      ),
    );
  }
}