import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class UserApi extends StatefulWidget {
  const UserApi({super.key});

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  getPosts() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');

    var response = await http.get(url);
    var responseBody = response.body;
    print(responseBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await getPosts();
        },
        tooltip: 'increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
