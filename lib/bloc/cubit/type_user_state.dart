part of 'type_user_cubit.dart';

abstract class TypeUserState {}

class TypeUserInitial extends TypeUserState {}

class UserType extends TypeUserState {
  final String type;

  UserType(this.type);
}
