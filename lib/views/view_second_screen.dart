import 'package:flutter/material.dart';
import 'package:suitmedia_test/views/view_third_screen.dart';

class SecondScreen extends StatelessWidget {
  final String name;

  const SecondScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Second Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome"),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Spacer(),
            Center(
              child: Text(
                "Selected User Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 40,
            width: 310,
            decoration: BoxDecoration(
              color: Color(0xff2B637B),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2B637B), elevation: 0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThirdScreen(),
                  ),
                );
              },
              child: const Text(
                "Choose a User",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
