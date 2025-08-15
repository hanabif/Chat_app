import 'package:chat_app/pages/blocked_users_page.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);

    final textColor =
        theme.brightness == Brightness.dark
            ? Colors.pink.shade500
            : Colors.black;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              //dark mode
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dark mode', style: TextStyle(color: textColor)),
                    Switch(
                      value:
                          Provider.of<ThemeProvider>(
                            context,
                            listen: false,
                          ).isDarkMode,
                      onChanged:
                          (value) => {
                            Provider.of<ThemeProvider>(
                              context,
                              listen: false,
                            ).toggleTheme(),
                          },
                    ),
                  ],
                ),
              ),

              //blocked users
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Blocked users', style: TextStyle(color: textColor)),

                    //button to go to blocked users
                    IconButton(
                      onPressed:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlockedUsersPage(),
                            ),
                          ),
                      icon: Icon(
                        Icons.arrow_forward_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
