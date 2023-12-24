import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/theme_colors..dart';
import 'package:suitmedia_test/components/theme_text.dart';
import 'package:suitmedia_test/models/model_user.dart';
import 'package:suitmedia_test/services/service_user.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<UserModel> users = [];
  int currentPage = 1;
  bool isLoading = false;

  Future<void> fetchUsers() async {
    final response = await ServiceUser.fetchUsers(page: currentPage);
    if (currentPage == 1) {
      users = response;
    } else if (currentPage == 2) {
      users.addAll(response);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

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
          "Third Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          currentPage = 2;
          await fetchUsers();
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context, '${user.firstName} ${user.lastName}');
                },
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(
                  '${user.firstName} ${user.lastName}',
                  style: TextSystem.text_fullName.copyWith(
                    color: ColorSystem.color_black,
                  ),
                ),
                subtitle: Text(
                  user.email,
                  style: TextSystem.text_email.copyWith(
                    color: ColorSystem.color_black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
