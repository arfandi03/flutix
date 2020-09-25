part of 'models.dart';

class Credit extends Equatable {
  final String name, profilePath, director;

  Credit({this.name, this.profilePath, this.director});

  @override
  List<Object> get props => [name, profilePath, director];
}
