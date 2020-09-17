part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("CGV 23 Pascal Hyper Square"),
  Theater("CGV 23 Parin Van Java"),
  Theater("XXI Cihampelas Walk"),
  Theater("XXI Bandung Trade Center")
];
