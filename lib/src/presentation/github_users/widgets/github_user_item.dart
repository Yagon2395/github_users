import 'package:flutter/material.dart';
import 'package:github_users/src/domain/entities/entities.dart';

class GithubUserItem extends StatelessWidget {
  final GithubUser user;
  const GithubUserItem({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 196,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _PhotoProfile(source: user.avatar_url),
              Expanded(child: _UserInfo(user: user)),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhotoProfile extends StatelessWidget {
  final String source;
  const _PhotoProfile({Key? key, required this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0), //or 15.0
        child: Image.network(source),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  final GithubUser user;
  const _UserInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Id: ${user.id}'),
        Text(user.login),
        Text(user.node_id),
        Text(user.url),
      ],
    );
  }
}
