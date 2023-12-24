import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/theme_colors..dart';
import 'package:suitmedia_test/views/view_second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController palindromController = TextEditingController();

  String reverseString(String input) {
    return input.split('').reversed.join('');
  }

  bool isPalindrome(String input) {
    String reversed = reverseString(input);
    return input == reversed;
  }

  @override
  void dispose() {
    nameController.dispose();
    palindromController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: ColorSystem.gradient_background,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: const Icon(
                    Icons.person_add_alt_1_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 40,
                  width: 310,
                  child: TextField(
                    controller: nameController,
                    cursorColor: Colors.cyan,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.only(top: 5, left: 10),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: 310,
                  child: TextField(
                    controller: palindromController,
                    cursorColor: Colors.cyan,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.only(top: 5, left: 10),
                      hintText: 'Palindrome',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      filled: true,
                      fillColor: ColorSystem.color_white,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
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
                    onPressed: () {
                      String inputText = palindromController.text;
                      if (isPalindrome(inputText)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$inputText adalah palindrome'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$inputText bukan palindrome.'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'CHECK',
                      style: TextStyle(
                        color: ColorSystem.color_white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
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
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Nama Wajib Diisi'),
                          ),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            name: nameController.text,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
