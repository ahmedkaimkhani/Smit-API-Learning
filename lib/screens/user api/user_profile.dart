import 'package:flutter/material.dart';
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
          children: [
            Center(
              child: Text(widget.user!.id.toString()),
            ),
            Text(widget.user!.name.toString())
          ],
        ),
      ),
    );
  }
}
