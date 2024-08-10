import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/cubit/user_cubit.dart';
import 'package:suitmedia_test/data/models/user_model.dart';

class ItemUser extends StatelessWidget {
  const ItemUser({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network(
          user.avatar,
          scale: 2.5,
        ),
      ),
      subtitle: Text(
        user.email,
        style: const TextStyle(
          color: Color(0xFF757575),
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      title: Text(
        user.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        userCubit.selectUser(user.name);
        userCubit.reset();
        Navigator.pop(context);
      },
    );
  }
}
