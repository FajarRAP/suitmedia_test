part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {}

class UserEmpty extends UserState {}

class UserError extends UserState {}

class UserSelected extends UserState {}

class MoreUserLoading extends UserLoaded {}

class NoMoreUser extends UserLoaded {}
