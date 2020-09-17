part of 'models.dart';

class UserProfile extends Equatable {
  final String id, email, name, picture, language;
  final List<String> selectedGenres;
  final int balance;

  UserProfile(this.id, this.email,
      {this.name,
      this.picture,
      this.balance,
      this.selectedGenres,
      this.language});

  UserProfile copyWith({String name, String picture, int balance}) =>
      UserProfile(this.id, this.email,
          name: name ?? this.name,
          picture: picture ?? this.picture,
          balance: balance ?? this.balance,
          selectedGenres: selectedGenres,
          language: language);

  @override
  String toString() {
    // ignore: todo
    // TODO: implement toString
    return "[$id] - $name, $email";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props =>
      [id, email, name, picture, selectedGenres, language, balance];
}
