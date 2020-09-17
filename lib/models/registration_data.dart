part of 'models.dart';

class RegistrationData {
  String email, password, name, language;
  List<String> selectedGenres;
  File picture;

  RegistrationData(
      {this.email = "",
      this.password = "",
      this.name = "",
      this.selectedGenres = const [],
      this.language = "",
      this.picture});
}
