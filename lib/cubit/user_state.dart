part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> datas;

  UserLoaded(this.datas);
}

class UserEmpty extends UserState {}

class UserError extends UserState {}

class UserSelected extends UserState {}

