import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suitmedia_test/data/models/user_model.dart';
import 'package:suitmedia_test/data/repositories/user_repositories.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.userRepositories,
  }) : super(UserInitial());

  final UserRepositories userRepositories;

  late String name;
  String username = 'Selected User Name';
  List<User> users = [];
  int page = 1;
  int numContent = 5;

  Future<void> getUsers() async {
    if (page > 1) {
      emit(MoreUserLoading());
    } else {
      emit(UserLoading());
    }

    final result = await userRepositories.getUsers(page, numContent);

    if (page == 1 && result.isEmpty) {
      emit(UserEmpty());
    } else if (result.isEmpty) {
      emit(NoMoreUser());
    } else {
      if (page > 1) {
        users.addAll(result);
      } else {
        users.clear();
        users = result;
      }
      emit(UserLoaded());
    }
  }

  void selectUser(String username) {
    this.username = username;
    emit(UserSelected());
  }

  void nextPage() => ++page;

  void reset() {
    page = 1;
    users.clear();
  }
}
