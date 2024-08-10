import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/cubit/user_cubit.dart';
import 'package:suitmedia_test/pages/third_screen.dart';
import 'package:suitmedia_test/pages/widgets/button_styled.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              userCubit.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return Text(
                    userCubit.username,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            ButtonStyled(
              text: 'Choose a User',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThirdScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
