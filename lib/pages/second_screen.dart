import 'package:flutter/material.dart';
import 'package:suitmedia_test/pages/third_screen.dart';
import 'package:suitmedia_test/pages/widgets/button_styled.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Selected User Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
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
