import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrent;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    // Pick bubble colors based on the theme
    final bubbleColor = isCurrent ? theme.primary : theme.secondary;
    final textColor = isCurrent
        ? (theme.brightness == Brightness.dark ? Colors.black : Colors.white)
        : (theme.brightness == Brightness.dark ? const Color.fromARGB(255, 235, 106, 106) : Colors.black);

    return Container(
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
