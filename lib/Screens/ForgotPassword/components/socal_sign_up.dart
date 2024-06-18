import 'package:flutter_firabase_login_responsive_ui/Screens/ForgotPassword/components/social_icon.dart';
import 'package:flutter_firabase_login_responsive_ui/controller/auth_controller/email_password_controller.dart';
import 'package:flutter/material.dart';

import '../../../screens/ForgotPassword/components/or_divider.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocialIconButton(
              iconSrc: "assets/icons/google.svg",
              press: () {
                FirebaseAuthService().signInWithGoogle();
              },
            ),
            SocialIconButton(
              iconSrc: "assets/icons/apple.svg",
              press: () {
                FirebaseAuthService().signInWithApple();
              },
            ),
          ],
        ),
      ],
    );
  }
}
