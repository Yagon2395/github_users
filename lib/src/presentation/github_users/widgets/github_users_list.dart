import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/src/presentation/github_users/github_users.dart';

import '../../../domain/entities/entities.dart';
import '../bloc/github_users_bloc.dart';

class GithubUsersList extends StatelessWidget {
  const GithubUsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubUsersBloc, GithubUsersState>(
      builder: (context, state) {
        // Helper for handling null list
        List<GithubUser> users = [];
        if (state.users != null) {
          users = state.users!;
        }

        // When status is loading and the list is empty
        if (users.isEmpty && state.status == GitHubUsersStatus.loading) {
          return const Align(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(),
          );
        }
        // When tried to fetch data but did not return any user
        else if (state.status == GitHubUsersStatus.loaded && users.isEmpty) {
          return const Center(child: Text('Empty list'));
        }
        // When fetched data successfully
        else {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: ((context, index) {
              if (users.length - state.nextPageTreshold == index) {
                context.read<GithubUsersBloc>().add(FetchUsersRequested());
              }

              // When last index is the tail of the list
              if (index == users.length - 1) {
                return const Align(
                  alignment: Alignment.topCenter,
                  child: CircularProgressIndicator(),
                );
              }
              // Render user layout
              else if (users.isNotEmpty) {
                return GithubUserItem(user: users[index]);
              }
              // Handling unwanted scenarios with empty view
              else {
                return const SizedBox.shrink();
              }
            }),
          );
        }
      },
    );
  }
}
