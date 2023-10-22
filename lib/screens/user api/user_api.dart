import 'package:flutter/material.dart';
import 'package:smit_api_learning/main.dart';

class UserApi extends StatefulWidget {
  const UserApi({super.key});

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Text('Fetching Api Data'),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  toggleTheme();
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
