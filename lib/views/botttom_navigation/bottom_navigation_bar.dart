import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_login/views/user/userlist/user_list_view.dart';
import 'package:mvvm_login/view_models/controllers/login/login_controller.dart';
import 'package:mvvm_login/view_models/controllers/user/userlist/user_list_controller.dart';
import 'package:mvvm_login/views/Settings/settings_view.dart';
import 'package:mvvm_login/views/bussiness/bussiness_view.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  // final loginVM = Get.find<LoginViewModel>();

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold, // fixed
  );

  static  List<Widget> _widgetOptions = <Widget>[
    UserListScreen(),
    BusinessViewScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0 && Get.isRegistered<UserListViewModel>()) {
      Get.find<UserListViewModel>().fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: 'Users'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[800],
        onTap: _onItemTapped,
      ),
    );
  }
}