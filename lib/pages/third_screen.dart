import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        itemBuilder: (context, index) => ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.indigo,
            ),
            width: 50,
            height: 50,
          ),
          subtitle: const Text(
            'fajary781@gmail.com',
            style: TextStyle(
              color: Color(0xFF757575),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          title: Text(
            'Person $index',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {},
        ),
        itemCount: 5,
      ),
    );
  }
}
