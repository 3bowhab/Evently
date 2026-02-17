import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignIn signIn = GoogleSignIn.instance;

    signIn.initialize(serverClientId: '643907720058-arb2qf3qcvnvccsn0n6tdbc77eokncap.apps.googleusercontent.com');

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate(
        );

    if (googleUser == null) return null;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignIn signIn = GoogleSignIn.instance;

  //     signIn.initialize(serverClientId: dotenv.env['server_client_id']);

  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
  //         .authenticate();

  //     if (googleUser == null) {
  //       return null;
  //     }

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth = googleUser.authentication;

  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken,
  //     );

  //     // Once signed in, return the UserCredential
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithCredential(credential);

  //     var firebaseUser = userCredential.user;

  //     UserModel user = UserModel(
  //       id: firebaseUser!.uid,
  //       name: firebaseUser.displayName ?? "",
  //       email: firebaseUser.email ?? "",
  //     );
  //     FirebaseUtils.addUserToFireStore(user);

  //     var userProvider = Provider.of<UserProvider>(context, listen: false);
  //     userProvider.updateUser(user);

  //     var eventListProvider = Provider.of<EventListProvider>(
  //       context,
  //       listen: false,
  //     );
  //     eventListProvider.changeSelectedIndex(0, firebaseUser.uid);

  //     SharedPreferenceUtils.saveData(key: "uId", value: user.id);
  //     SharedPreferenceUtils.saveData(key: "uName", value: user.name);
  //     SharedPreferenceUtils.saveData(key: "uEmail", value: user.email);

  //     DialogUtils.showMessage(
  //       context: context,
  //       message: "Google sign in successful",
  //       posActionName: "ok",
  //       posAction: () {
  //         Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  //       },
  //     );
  //   } catch (e) {
  //     print(e.toString());
  //     DialogUtils.showMessage(
  //       context: context,
  //       message: e.toString(),
  //       title: "Google sign in failed",
  //       posActionName: "ok",
  //       posAction: () {
  //         Navigator.of(context).pop();
  //       },
  //     );
  //     return null;
  //   }
  // }
}

