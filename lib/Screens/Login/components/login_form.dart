import 'package:flutter_firabase_login_responsive_ui/Screens/ForgotPassword/signup_screen.dart';
import 'package:flutter_firabase_login_responsive_ui/Screens/TakeInfo/takeInfoForUserProfile.dart';
import 'package:flutter_firabase_login_responsive_ui/Utils/toastUtils.dart';
import 'package:flutter_firabase_login_responsive_ui/controller/auth_controller/email_password_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../ForgotPassword/forgot_my_password.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String lastEmail="";
  String lastPassword="";

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (email) {
              setState(() {
                lastEmail=email;
              });

            },
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onChanged: (password){
                print(password);
                setState(() {
                  lastPassword=password;
                });

              },
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: ()async {

              User? user= await FirebaseAuthService().signInWithEmailAndPassword(lastEmail, lastPassword);
              if(user!=null){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TakeUserInfoPage();
                    },
                  ),
                );
              }else{
                showShortToast(message: "User not created");
              }

            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: ()async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SingUpScreen();
                  },
                ),
              );

            },

            child: Text(
              "Create Account".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],

    );
  }
}


