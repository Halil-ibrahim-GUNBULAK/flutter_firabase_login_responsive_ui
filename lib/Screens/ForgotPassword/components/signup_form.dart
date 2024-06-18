import 'package:flutter_firabase_login_responsive_ui/Screens/Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../Utils/toastUtils.dart';
import '../../../constants.dart';
import '../../../controller/auth_controller/email_password_controller.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String lastEmail="";
  String lastPassword="";
  String passwordRepeat="";

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (email){
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
            padding: const EdgeInsets.symmetric(vertical: defaultPadding/3),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onChanged: (password){

                setState(() {
                  lastPassword=password;
                });

              },
              decoration: const InputDecoration(
                hintText: "Şifre",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
         TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onChanged: (password){

                setState(() {
                  passwordRepeat=password;
                });

              },
              decoration: const InputDecoration(
                hintText: "Şifre Tekrarı",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async{
              if(checkPasswordSameOrWeak(lastPassword, passwordRepeat)){
                User? user= await FirebaseAuthService().signUpWithEmailAndPassword(lastEmail, lastPassword);
                if(user!=null){
                  showLongToast(message: "Kayıt Başarılı !Hesabınıza giriş yapabilirsiniz");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                }

              }
              else{
                showShortToast(message: "Kullanıcı oluşturulamadı");
              }
            },
            child: Text("Kayıt Ol".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),

        ],
      ),
    );
  }
  bool checkPasswordSameOrWeak(String password1,String password2){
    if(password1==""){
      showShortToast(message: "Şifre Boş Olamaz");
      return false;
    }
    else if(password1!=password2){
      showShortToast(message: "Lütfen Aynı Şifreyi Yazın");
      return false;
    }else if (password1.length<8){
      showLongToast(message: "Şifre minumum 8 karakterli olmalıdır");
      return false;
    }

    return true;
  }
}

