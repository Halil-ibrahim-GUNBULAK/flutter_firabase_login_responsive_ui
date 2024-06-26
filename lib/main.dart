import 'package:flutter_firabase_login_responsive_ui/Screens/TakeInfo/takeInfoForUserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firabase_login_responsive_ui/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_firabase_login_responsive_ui/constants.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
if (kIsWeb) {

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey:            "",
        authDomain:        "",
        projectId:         "",
        storageBucket:     "",
        messagingSenderId: "",
        appId:             "",
        measurementId:     "",
      // Your web Firebase config options
      // Can you find Firebase web config Project Settings >> General >> Web App >> SDK setup and configuration

    ),
  );
} else {
  await Firebase.initializeApp();
}

runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const  TakeUserInfoPage();
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
