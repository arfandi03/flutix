import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      UserProfile userProfile = await UserServices.getUser(event.id);
      yield UserLoaded(userProfile);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      UserProfile updateUser = (state as UserLoaded)
          .userProfile
          .copyWith(name: event.name, picture: event.picture);

      await UserServices.updateUser(updateUser);

      yield UserLoaded(updateUser);
    }
  }
}
