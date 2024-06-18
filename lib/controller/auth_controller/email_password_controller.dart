
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../Utils/toastUtils.dart';



//TODO we have just login screen , sign up not here so if first sigh up any email we create new account
class FirebaseAuthService {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        showLongToast(message: 'This mail already use');
      }else if (e.code == 'invalid-email') {
        showShortToast(message: 'Not invalid Mail Adress');
      } else {
        showShortToast(message: 'Error: ${e.code}');
      }
    }
    return null;

  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showShortToast(message: 'user not found');
      }else if ( e.code == 'wrong-password'){
        showShortToast(message: 'wrong password.');
      } else {
        showShortToast(message: 'An error occurred: ${e.code}');
      }

    }
    return null;

  }
  void forgotMyPassword(String email) async {
    //TODO and then Navigate  login page
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) {
      // if success then show this message
      showLongToast(message: "We send reset mail , Please check your mail adress");
    }).onError((error, stackTrace) {
      // if unsuccess then show error message
      showShortToast(message: error.toString());
    });
  }
  //TODO Google Sign in and Sign out Method

  // dont't forget to add firebasea auth and google sign in package
  signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

// for sign out
  googleSignOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    _auth.signOut();
  }
  //TODO APPLE Sign in  Maybe you create try catch blocks

  Future<UserCredential> signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}