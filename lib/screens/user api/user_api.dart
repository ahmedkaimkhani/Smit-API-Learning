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
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
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
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder(
                future: getUserData(),
                builder: ((BuildContext context,
                    AsyncSnapshot<List<UserModel>> snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(snapshot.data?[index].name ?? 'No Name'),
                            subtitle:
                                Text(snapshot.data?[index].email ?? 'No email'),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('something went wrong'));
                  }
                  return const CircularProgressIndicator();
                })),
          ],
        ),
      )),
    );
  }
}
