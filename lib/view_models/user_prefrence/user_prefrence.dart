import 'package:mvvm_login/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserPreference {
  Future<bool> saveUser(UserModel user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('accessToken', user.accessToken ?? '');
    sp.setBool('isLogin', user.isLogin ?? false);
    sp.setString('firstName', user.firstName ?? 'not found');
    sp.setString('lastName', user.lastName ?? 'not found');
    sp.setString('email', user.email ?? 'not found');
    sp.setString('username', user.username ?? 'not found');
    sp.setString('image', user.image ?? 'not found');
    sp.setInt('id', user.id ?? 0);
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return UserModel(
      accessToken: sp.getString('accessToken'),
      isLogin: sp.getBool('isLogin'),
      firstName: sp.getString('firstName'),
      lastName: sp.getString('lastName'),
      email: sp.getString('email'),
      username: sp.getString('username'),
      image: sp.getString('image'),
      id: sp.getInt('id')
    );
  }

  Future<bool> isLoggedIn() async {
    final user = await getUser();
    return user.isLogin == true && user.accessToken != null && user.accessToken!.isNotEmpty;
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
    return true;
  }

  Future<bool> isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_complete') ?? false;
  }

  Future<void> setOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);
  }
}