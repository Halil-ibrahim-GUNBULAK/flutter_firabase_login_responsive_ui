import 'package:flutter_firabase_login_responsive_ui/Screens/ForgotPassword/components/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firabase_login_responsive_ui/responsive.dart';
import '../../components/background.dart';
import 'components/forgot_password_top_image.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';
class ForgotMyPassWord extends StatefulWidget {
  const ForgotMyPassWord({super.key});

  @override
  State<ForgotMyPassWord> createState() => _ForgotMyPassWordState();
}

class _ForgotMyPassWordState extends State<ForgotMyPassWord> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileForgotMyPassWordScreen(),
          desktop: Row(
            children: [
              Expanded(
                child: ForgotPasswordScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: ForgotMyPasswordForm(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileForgotMyPassWordScreen extends StatelessWidget {
  const MobileForgotMyPassWordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SignUpScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),

      ],
    );
  }
}
