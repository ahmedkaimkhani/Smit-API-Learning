import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:smit_api_learning/screens/user%20api/theme_provider.dart';
import 'package:smit_api_learning/screens/user%20api/user_profile.dart';
import 'package:smit_api_learning/services/user_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UserApi extends StatefulWidget {
  const UserApi({super.key});

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
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
    final provider = Provider.of<ThemeProvider>(context);
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
                    activeColor: Colors.white,
                    value: provider.theme.brightness == Brightness.dark,
                    onChanged: (value) {
                      provider.toggleTheme();
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: FutureBuilder(
                future: getUserData(),
                builder: ((BuildContext context,
                    AsyncSnapshot<List<UserModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
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
                              title: Text(
                                allUsersData?.name ?? 'No Name',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(allUsersData?.email ?? 'No email'),
                              trailing: Text(
                                allUsersData?.id.toString() ?? 'No id',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor:
                                    provider.theme.brightness == Brightness.dark
                                        ? null
                                        : Colors.black,
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('something went wrong'));
                  }
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: provider.theme.brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      size: 60,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
