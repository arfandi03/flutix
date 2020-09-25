part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenre, String language) async {
    try {
      // Daftarkan ke firebase auth
      // Mengembalikan auth result(userCredential)
      // firebase auth yang dikembalikan adalah firebase user jika tidak null
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Membuat data user di firestore sesuai variabel signUp
      // convert firebase user(User) menjadi user profile
      UserProfile userProfile = result.user.convertToUser(
          name: name, selectedGenres: selectedGenre, language: language);

      await UserServices.updateUser(userProfile);

      return SignInSignUpResult(userProfile: userProfile);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserProfile userProfile = await result.user.fromFireStore();
      print("try");
      return SignInSignUpResult(userProfile: userProfile);
    } catch (e) {
      print("catch");
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<void> singOut() async {
    await _auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  static Stream<User> get userStream => _auth.authStateChanges();
}

// ignore: camel_case_types
class SignInSignUpResult {
  final UserProfile userProfile;
  final String message;

  SignInSignUpResult({this.userProfile, this.message});
}
