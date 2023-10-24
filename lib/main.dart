import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smit_api_learning/screens/user%20api/theme_provider.dart';
import 'package:smit_api_learning/screens/user%20api/user_api.dart';

bool isDarkMode = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
            key: UniqueKey(),
            title: 'Api Learning',
            debugShowCheckedModeBanner: false,
            theme: provider.theme,
            home: const UserApi());
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
      },
    );
  }
}
