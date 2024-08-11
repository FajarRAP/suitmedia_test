import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/cubit/user_cubit.dart';
import 'package:suitmedia_test/pages/widgets/button_styled.dart';
import 'package:suitmedia_test/pages/widgets/item_user.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        leading: IconButton(
          onPressed: () {
            userCubit.reset();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        bloc: userCubit..getUsers(),
        builder: (context, state) {
          if (state is UserLoaded) {
            return RefreshIndicator(
              displacement: 10,
              onRefresh: () async {
                userCubit.reset();
                userCubit.getUsers();
              },
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                itemBuilder: (context, index) {
                  if (index < userCubit.users.length) {
                    return ItemUser(user: userCubit.users[index]);
                  } else {
                    if (state is NoMoreUser) {
                      return const Center(
                        child: Text(
                          'No Data Available',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }

                    if (state is MoreUserLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ButtonStyled(
                      text: 'Load More',
                      onPressed: () {
                        userCubit.nextPage();
                        userCubit.getUsers();
                      },
                    );
                  }
                },
                itemCount: userCubit.users.length + 1,
              ),
            );
          }
          if (state is UserEmpty) {
            return const Center(
              child: Text(
                'No Data Available',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
