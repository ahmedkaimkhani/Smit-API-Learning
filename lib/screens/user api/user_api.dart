import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smit_api_learning/main.dart';
import 'package:http/http.dart' as http;
import 'package:smit_api_learning/services/user_model.dart';

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

  Future<List<UserModel>> getUserData() async {
    List<UserModel> allUsers = [];
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    for (var i in responseBody) {
      allUsers.add(UserModel.fromJson(i));
    }
    return allUsers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Fetching Api Data',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                Switch(
                  inactiveThumbColor: Colors.black,
                  value: isDarkMode,
                  onChanged: (value) {
                    toggleTheme();
                  },
                )
              ],
            ),
            FutureBuilder(
                future: getUserData(),
                builder: ((BuildContext context,
                    AsyncSnapshot<List<UserModel>> snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return const ListTile();
                    },
                  );
                })),
          ],
        ),
      )),
    );
  }
}
