import 'package:flutter/material.dart';
import 'package:mvvm_login/models/user/userList/user_list.dart';

class UserCard extends StatelessWidget {
  final UserList user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(user.image),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.firstName +  user.lastName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'phone: ${user.phone}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}