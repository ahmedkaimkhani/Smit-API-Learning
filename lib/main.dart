import 'package:flutter/material.dart';
import 'package:smit_api_learning/screens/user%20api/theme.dart';
import 'package:smit_api_learning/screens/user%20api/user_api.dart';
import 'package:smit_api_learning/screens/without%20model%20user%20api/user_api.dart';

bool isDarkMode = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Api Learning',
        debugShowCheckedModeBanner: false,
        theme: isDarkMode ? lightTheme : darkTheme,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        home: UserApi());
  }
}
