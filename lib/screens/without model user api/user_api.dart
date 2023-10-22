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
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api learning'),
      ),
      body: FutureBuilder(
          future: getPosts(),
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['name']),
                    subtitle: Text(snapshot.data[index]['email']),
                  );
                },
              );
            }
            // else if (snapshot.hasError) {
            //   return const Center(child: Text('something went wrong'));
            // }
            return const Center(child: CircularProgressIndicator());
          })),
    );
  }
}
