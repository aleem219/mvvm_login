import 'package:flutter/material.dart';
import 'package:mvvm_login/models/settings/setting_list.dart';
import 'package:mvvm_login/views/settings/widgets/profile_tile.dart';
import 'package:mvvm_login/views/settings/widgets/settings_tile.dart';
import 'package:mvvm_login/views/settings/widgets/settings_toggle_tile.dart';
import 'package:mvvm_login/res/app_dialog/app_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  final List<SettingsItem> _items = const [
    SettingsItem(icon: Icons.notifications_rounded,color: Color(0xFFF4623A), title: 'Notifications'),
    SettingsItem(icon: Icons.lock_rounded,color: Color(0xFFF5C518),title: 'Privacy'),
    SettingsItem(icon: Icons.vpn_key_rounded,color: Color(0xFF2DD4CF),title: 'Security'),
    SettingsItem(icon: Icons.tune_rounded,color: Color(0xFF9B6CF6),title: 'Appearance'),
    SettingsItem(icon: Icons.chat_bubble_rounded,color: Color(0xFFF4623A),title: 'Ask a Question'),
    SettingsItem(icon: Icons.help_rounded,color: Color(0xFF2DD4CF),title: 'FAQ'),
    SettingsItem(icon: Icons.logout,color: Color(0xFF4E342E),title: 'Logout'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ProfileTile(
                name: 'Debbie',
                phone: '+23480798765432',
                imageUrl:
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                onTap: () {},
              ),
            ),

            const SizedBox(height: 8),
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFEEEEEE),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 4),
                // +1 for the Dark Mood toggle row at the top
                itemCount: _items.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SettingsToggleTile(
                      icon: Icons.dark_mode_rounded,
                      iconBg: const Color(0xFF6C4CE0),
                      title: 'Dark Mood',
                      value: isDarkMode,
                      onChanged: (val) => setState(() => isDarkMode = val),
                    );
                  }
                  final item = _items[index - 1];
                  final isLast = index == _items.length;
                  return SettingsTile(
                    icon: item.icon,
                    iconBg: item.color,
                    title: item.title,
                    onTap: () {
                      debugPrint('Tapped row index: $index (${item.title})');
                      if (isLast) {
                        AppDialog.show(
                          context: context,
                          title: 'Logout',
                          message: 'Are you sure, You want to logout?',
                          titleColor: Colors.teal,
                          primaryButtonText: 'Logout',
                          onPrimaryPressed: () {
                            Navigator.pop(context);
                            // delete logic
                          },
                          secondaryButtonText: 'Cancel',
                        );
                      } else {
                        // Default action for every other row
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

