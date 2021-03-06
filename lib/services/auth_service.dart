import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static Future<User?> signInWithGoogle() async {
    // ! static helps to access the function without initializing the class
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn()
        .signIn(); //! ? indicates that googleUser may or may not be null

    if (googleUser == null) return null;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  }

  static Future<User?> signInWithGoogleWeb() async {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      // Once signed in, return the UserCredential
      return (await FirebaseAuth.instance.signInWithPopup(googleProvider)).user;
  }
}
