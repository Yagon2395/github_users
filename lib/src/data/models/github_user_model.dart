import 'package:github_users/src/domain/entities/entities.dart';

class GithubUserModel extends GithubUser {
  const GithubUserModel({
    required super.login,
    required super.id,
    required super.node_id,
    required super.avatar_url,
    required super.url,
  });

  factory GithubUserModel.fromJson(Map<String, dynamic> json) => GithubUserModel(
        login: json['login'],
        id: json['id'],
        node_id: json['node_id'],
        avatar_url: json['avatar_url'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'login': login,
        'id': id,
        'node_id': node_id,
        'avatar_url': avatar_url,
        'url': url,
      };
}
