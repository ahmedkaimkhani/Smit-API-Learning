import 'package:flutter/material.dart';
import 'package:smit_api_learning/main.dart';
import 'package:smit_api_learning/services/user_model.dart';

class UserProfile extends StatefulWidget {
  final UserModel? user;
  const UserProfile({super.key, required this.user});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor:
                  isDarkMode == true ? Colors.yellow[200] : Colors.green[200],
              child: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
