import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:chat_app/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class BlockedUsersPage extends StatelessWidget {
  BlockedUsersPage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void _showUnblockBox(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Unblock User'),
            content: Text('Are you sre you want to unblock this user?'),
            actions: [
              //cancel button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),

              //unblock button
              TextButton(
                onPressed: () {
                  _chatService.unblockUser(userId);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('User unblocked')));
                },
                child: Text('Unblock'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String userId = _authService.currentUser()!.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocked Users'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _chatService.getBlockedUsersStream(userId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('An error has occured');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final blockedUsers = snapshot.data ?? [];

          if (blockedUsers.isEmpty) {
            return Center(child: Text('No blocked users'));
          }

          return ListView.builder(
            itemCount: blockedUsers.length,
            itemBuilder: (context, index) {
              final user = blockedUsers[index];
              return UserTile(
                name: user['email'],
                onTap: () => _showUnblockBox(context, user['uid']),
              );
            },
          );
        },
      ),
    );
  }
}
