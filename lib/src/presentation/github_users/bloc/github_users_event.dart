part of 'github_users_bloc.dart';

abstract class GithubUsersEvent extends Equatable {
  const GithubUsersEvent();

  @override
  List<Object> get props => [];
}

class FetchUsersRequested extends GithubUsersEvent {}
