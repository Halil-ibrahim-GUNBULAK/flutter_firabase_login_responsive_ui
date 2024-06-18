import 'package:flutter/material.dart';
import '../../Login/login_screen.dart';

class LoginAndForgotScreen extends StatefulWidget {
  const LoginAndForgotScreen({super.key});

  @override
  State<LoginAndForgotScreen> createState() => _LoginAndForgotScreenState();
}

class _LoginAndForgotScreenState extends State<LoginAndForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ),
            );
          },
          child: Text(
            "LOGIN".toUpperCase(),
          ),
        ),


      ],
    );
  }
}
