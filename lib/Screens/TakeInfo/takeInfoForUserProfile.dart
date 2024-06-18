import 'package:flutter_firabase_login_responsive_ui/Screens/Login/login_screen.dart';
import 'package:flutter_firabase_login_responsive_ui/controller/auth_controller/email_password_controller.dart';
import 'package:flutter/material.dart';

class TakeUserInfoPage extends StatefulWidget {
  const TakeUserInfoPage({super.key});

  @override
  State<TakeUserInfoPage> createState() => _TakeUserInfoPageState();
}

class _TakeUserInfoPageState extends State<TakeUserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Row(
          children: [
            Text("Home"),
            ElevatedButton(onPressed: (){
              FirebaseAuthService().signOut();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },child: Text("Sign Out"),)
          ],
        )
      ),
    );
  }
}
