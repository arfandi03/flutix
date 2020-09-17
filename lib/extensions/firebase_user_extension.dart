part of 'extensions.dart';

// ignore: deprecated_member_use
extension FirebaseUserExtension on User {
  UserProfile convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String language = "English",
          int balance = 50000}) =>
      UserProfile(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          language: language);

  Future<UserProfile> fromFireStore() async =>
      await UserServices.getUser(this.uid);
}
