import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/src/presentation/github_users/bloc/github_users_bloc.dart';
import 'package:github_users/src/presentation/github_users/github_users.dart';

import '../../../di/injector.dart';

class GithubUsersPage extends StatelessWidget {
  const GithubUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<GithubUsersBloc>(
          create: (context) => injector()..add(FetchUsersRequested()),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: GithubUsersList(),
          ),
        ),
      ),
    );
  }
}
