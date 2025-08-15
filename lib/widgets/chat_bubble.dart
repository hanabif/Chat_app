import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrent;
  final String messageId;
  final String userId;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrent,
    required this.messageId,
    required this.userId,
  });

  //show options
  void _showOptions(BuildContext context, String messageId, String userId) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              //report
              ListTile(
                leading: Icon(Icons.flag),
                title: Text('Report'),
                onTap: () {
                  Navigator.pop(context);
                  _reportContent(context, messageId, userId);
                },
              ),

              //block
              ListTile(
                leading: Icon(Icons.block_outlined),
                title: Text('Block'),
                onTap: () {
                  _blockUser(context, userId);
                },
              ),

              //cancel
              ListTile(
                leading: Icon(Icons.cancel_outlined),
                title: Text('Cancel'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ); 
      },
    );
  }

  void _reportContent(BuildContext context, String messageId, String userId) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Report Message'),
            content: Text('Are you sure you want to report this message'),
            actions: [
              TextButton(
                onPressed: () {
                  ChatService().reportUser(messageId, userId);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Message Reported')));
                },
                child: Text('Report'),
              ),
            ],
          ),
    );
  }

  void _blockUser(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Block User'),
            content: Text('Are you sure you want to block this user'),
            actions: [
              TextButton(
                onPressed: () {
                  ChatService().blockUser(userId);
                  Navigator.pop(context);
                  Navigator.pop(context); 
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('User Blocked')));
                },
                child: Text('Block'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final bubbleColor = isCurrent ? theme.primary : theme.secondary;
    final textColor =
        isCurrent
            ? (theme.brightness == Brightness.dark
                ? Colors.black
                : Colors.white)
            : (theme.brightness == Brightness.dark
                ? const Color.fromARGB(255, 235, 106, 106)
                : Colors.black);

    return GestureDetector(
      onLongPress: () {
        if (!isCurrent) {
          _showOptions(context, messageId, userId);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Text(message, style: TextStyle(color: textColor)),
      ),
    );
  }
}
