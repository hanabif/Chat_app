import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Home page',
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
        
      ),
      drawer: MyDrawer(),
    );
  }
}
