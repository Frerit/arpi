import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  static AuthController to = Get.put(AuthController());
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  var isLogin = false.obs;
  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser;
  Stream<User> get user => _auth.authStateChanges();

  @override
  void onReady() async {
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.value = await getUser;
    firebaseUser.bindStream(user);
  }

  handleAuthChanged(User _firebaseUser) async {
    if (_firebaseUser == null) {
      isLogin(false);
    } else {
      isLogin(true);
    }
  }

  Future<UserCredential> signInWithGoogle() async {

    try {
      // Trigger the authentication flow
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly'
        ]
      );
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar("Error", e);
    }
  }

}