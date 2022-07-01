import 'package:flutter/material.dart';
import 'package:github_users/src/di/injector.dart';

import 'src/presentation/github_users/github_users.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Users App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GithubUsersPage(),
    );
  }
}
