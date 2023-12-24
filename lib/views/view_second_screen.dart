import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/theme_colors..dart';
import 'package:suitmedia_test/components/theme_text.dart';
import 'package:suitmedia_test/views/view_third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String name;

  const SecondScreen({
    super.key,
    required this.name,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? selectedUserName;
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
              widget.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            Center(
              child: Text(
                selectedUserName ?? "Selected Username",
                style: TextSystem.text_fullName
                    .copyWith(color: ColorSystem.color_black, fontSize: 24),
              ),
            ),
            const Spacer(),
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
              color: ColorSystem.color_button,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorSystem.color_button,
                elevation: 0,
              ),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThirdScreen(),
                  ),
                ) as String?;
                if (result != null) {
                  setState(() {
                    selectedUserName = result;
                  });
                }
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
