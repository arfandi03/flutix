part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent {
  final String id;

  LoadUser(this.id);

  @override
  List<Object> get props => [id];
}

class SignOut extends UserEvent {
  @override
  List<Object> get props => [];
}

class UpdateData extends UserEvent {
  final String name, picture;

  UpdateData({this.name, this.picture});

  @override
  List<Object> get props => [name, picture];
}
