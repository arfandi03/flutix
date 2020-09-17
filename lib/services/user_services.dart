part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      // ignore: deprecated_member_use
      Firestore.instance.collection('users');

  static Future<void> updateUser(UserProfile userProfile) async {
    // Membuat selected genres menjadi satu string
    // String genres = '';
    // for (var genre in userProfile.selectedGenres)
    //   genres += genre + ((genre != userProfile.selectedGenres.last) ? "," : "");

    // ignore: deprecated_member_use
    _userCollection.document(userProfile.id).setData({
      'email': userProfile.email,
      'name': userProfile.name,
      'balance': userProfile.balance,
      'selectedGenres': userProfile.selectedGenres,
      'language': userProfile.language,
      'picture': userProfile.picture ?? ""
    });
  }

  static Future<UserProfile> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return UserProfile(id, snapshot.data()['email'],
        name: snapshot.data()['name'],
        balance: snapshot.data()['balance'],
        selectedGenres: (snapshot.data()['selectedGenres'] as List)
            .map((e) => e.toString())
            .toList(),
        language: snapshot.data()['language'],
        picture: snapshot.data()['picture']);
  }
}
