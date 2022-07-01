part of 'github_users_bloc.dart';

enum GitHubUsersStatus { loading, loaded, error }

class GithubUsersState extends Equatable {
  final GitHubUsersStatus status;
  final List<GithubUser>? users;
  final String? errorMessage;
  final int since;
  final int nextPageTreshold;

  const GithubUsersState({
    this.users,
    this.status = GitHubUsersStatus.loading,
    this.errorMessage,
    this.since = 0,
    this.nextPageTreshold = 5,
  });

  @override
  List<Object?> get props => [status, users, errorMessage];

  GithubUsersState copyWith({
    status,
    users,
    errorMessage,
    since,
    nextPageTreshold,
  }) {
    return GithubUsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
      since: since ?? this.since,
      nextPageTreshold: nextPageTreshold ?? this.nextPageTreshold,
    );
  }
}
