import 'package:flutter_firabase_login_responsive_ui/controller/auth_controller/email_password_controller.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
class ForgotMyPasswordForm extends StatefulWidget {
  const ForgotMyPasswordForm({super.key});

  @override
  State<ForgotMyPasswordForm> createState() => _ForgotMyPasswordFormState();
}

class _ForgotMyPasswordFormState extends State<ForgotMyPasswordForm> {
  String lastEmail="";
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
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

          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              FirebaseAuthService().forgotMyPassword(lastEmail);
            },
            child: Text("Yenileme E Postası Gönder".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),

        ],
      ),
    );
  }
}

