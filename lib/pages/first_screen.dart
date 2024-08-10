import 'package:flutter/material.dart';
import 'package:suitmedia_test/pages/second_screen.dart';
import 'package:suitmedia_test/pages/widgets/button_styled.dart';
import 'package:suitmedia_test/pages/widgets/my_text_field.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF9BC7CC),
                borderRadius: BorderRadius.circular(60),
              ),
              width: 120,
              height: 120,
              child: const Icon(
                Icons.person_add_alt_1,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(height: 50),
            MyTextField(
              hint: 'Name',
              controller: nameController,
            ),
            const SizedBox(height: 15),
            MyTextField(
              hint: 'Palindrome',
              controller: palindromeController,
            ),
            const SizedBox(height: 45),
            ButtonStyled(
              text: 'CHECK',
              onPressed: () {
                setState(() {});
                print(palindromeController.text);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: isPalindrome(palindromeController.text)
                        ? const Text(
                            'isPalindrome',
                            style: TextStyle(color: Color(0xFF66BB6A)),
                            textAlign: TextAlign.center,
                          )
                        : const Text(
                            'not palindrome',
                            style: TextStyle(color: Color(0xFFE53935)),
                            textAlign: TextAlign.center,
                          ),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            ButtonStyled(
              text: 'NEXT',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    palindromeController.dispose();
    super.dispose();
  }
}

bool isPalindrome(String str) {
  final String trimmed = str.replaceAll(' ', '');
  final int trimmedLength = trimmed.length;
  for (int i = 0, j = trimmedLength - 1; i < trimmedLength / 2; i++, j--) {
    if (trimmed[i] != trimmed[j]) {
      return false;
    }
  }
  return true;
}
