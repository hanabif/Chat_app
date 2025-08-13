import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confpassword = TextEditingController();
  final void Function()? onTap;
  RegisterPage({super.key, this.onTap});

  void register(BuildContext context) {
    final _authService = AuthService();

    if (_password.text == _confpassword.text) {
      try {
        _authService.signUpWithEmailPassword(_email.text, _password.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(title: Text('Passwords don\'t match')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message_rounded,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 50),

            //welcome back
            Text(
              'Let\'s create an account for you',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 50),
            // email
            Textfield(
              hintText: 'Email',
              obscureText: false,
              controller: _email,
            ),

            SizedBox(height: 10),
            //password
            Textfield(
              hintText: 'Password',
              obscureText: true,
              controller: _password,
            ),
            SizedBox(height: 25),

            //confirm pass
            Textfield(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confpassword,
            ),
            SizedBox(height: 25),

            //login button
            MyButton(text: 'Register', onTap: () => register(context)),
            SizedBox(height: 25),

            // register
            Row(
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
