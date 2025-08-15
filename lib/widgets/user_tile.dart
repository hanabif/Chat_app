import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/themes/theme_provider.dart';

class UserTile extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  
  const UserTile({super.key, required this.name, this.onTap});
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Decide text color based on theme
    final textColor = theme.brightness == Brightness.dark
        ? Colors.pink.shade500  // Dark mode: text over light pink container
        : Colors.black;         // Light mode: text over white/pink container

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(Icons.person_2_outlined, color: textColor),
            const SizedBox(width: 20),
            Text(
              name,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
