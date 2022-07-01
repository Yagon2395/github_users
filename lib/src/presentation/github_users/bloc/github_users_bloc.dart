import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/src/domain/usecases/get_users_usecase.dart';

import '../../../domain/entities/entities.dart';

part 'github_users_event.dart';
part 'github_users_state.dart';

class GithubUsersBloc extends Bloc<GithubUsersEvent, GithubUsersState> {
  final GetUsersUsecase getUsersUsecase;
  GithubUsersBloc(this.getUsersUsecase) : super(const GithubUsersState()) {
    on<FetchUsersRequested>((event, emit) async {
      // Simulate slow connection
      await Future.delayed(const Duration(seconds: 3));

      var result = await getUsersUsecase(GetUsersUsecaseParams(state.since, 20));

      result.fold((l) {
        emit(state.copyWith(status: GitHubUsersStatus.error, errorMessage: l.message));
      }, (r) {
        emit(state.copyWith(
          status: GitHubUsersStatus.loaded,
          users: List<GithubUser>.from(state.users ?? [])..addAll(r),
          errorMessage: null,
          since: r.last.id,
          // Users API only allow pagination by "since" parameter that filter only users with id
          // greater than that, i am paginating by id.
          // See https://docs.github.com/en/github-ae@latest/rest/users/users
        ));
      });
    });
  }
}
