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
    final user = widget.user;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 30),
          child: Container(
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: isDarkMode == true
                        ? Colors.yellow[200]
                        : Colors.green[200],
                    child: const Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 08,
                ),
                Text(
                  'Id: ${user!.id}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Container(
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name :  ${user.name}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
