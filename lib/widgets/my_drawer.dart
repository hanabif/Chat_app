import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final _authService = AuthService();

    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          Column(
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,

                child: Center(
                  child: Icon(
                    Icons.message_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 64,
                  ),
                ),
              ),

              //home
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home_outlined),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              //settings
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ),
            ],
          ),

          //logout
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout_rounded),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
