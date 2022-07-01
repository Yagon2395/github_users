import 'package:equatable/equatable.dart';

class GithubUser extends Equatable {
  final String login;
  final int id;
  final String node_id;
  final String avatar_url;
  final String url;

  const GithubUser(
      {required this.login, required this.id, required this.node_id, required this.avatar_url, required this.url});
  @override
  List<Object?> get props => [
        login,
        id,
        node_id,
        avatar_url,
        url,
      ];
}
