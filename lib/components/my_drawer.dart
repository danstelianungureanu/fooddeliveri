import 'package:flutter/material.dart';
import 'package:fooddeliveri/components/my_drawer_tile.dart';
import 'package:fooddeliveri/pages/settings_page.dart';
import 'package:fooddeliveri/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(
              top: 100,
            ),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home list tile
          MyDrawerTile(
            text: 'Home',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          // settings list tile
          MyDrawerTile(
            text: 'Settings',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Spacer(),
          // logout list tile
          MyDrawerTile(
            text: 'Logout',
            icon: Icons.logout,
            onTap: () {
              logout();
            },
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
