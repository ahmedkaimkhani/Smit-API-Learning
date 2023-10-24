import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smit_api_learning/main.dart';
import 'package:http/http.dart' as http;
import 'package:smit_api_learning/screens/user%20api/user_profile.dart';
import 'package:smit_api_learning/services/user_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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

  Color? customTileColorMethod(index) {
    if (2 % index == 1) {
      return Colors.green[200];
    } else {
      return Colors.yellow[200];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: const Text(
      //     'Fetching Api Data',
      //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      //   ),
      //   actions: [
      //     Switch(
      //       inactiveThumbColor: Colors.black,
      //       value: isDarkMode,
      //       onChanged: (value) {
      //         toggleTheme();
      //       },
      //     )
      //   ],
      // ),
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
                        final allUsersData = snapshot.data?[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UserProfile(user: allUsersData),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: ListTile(
                              title: Text(allUsersData?.name ?? 'No Name'),
                              subtitle: Text(allUsersData?.email ?? 'No email'),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('something went wrong'));
                }
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.white, size: 60),
                );
              }),
            ),
          ],
        ),
      )),
    );
  }
}
