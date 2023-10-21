import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class UserModelWithoutModel extends StatefulWidget {
  const UserModelWithoutModel({super.key});

  @override
  State<UserModelWithoutModel> createState() => _UserModelWithoutModelState();
}

class _UserModelWithoutModelState extends State<UserModelWithoutModel> {
  getPosts() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');

    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    print(responseBody[0]['address']['city']);
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
