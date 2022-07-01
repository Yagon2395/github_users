import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:github_users/src/domain/failures/failures.dart';
import 'package:github_users/src/domain/repositories/github_repository.dart';
import 'package:github_users/src/domain/usecases/base_usecase.dart';

import '../entities/entities.dart';

class GetUsersUsecase implements BaseUsecase<List<GithubUser>, GetUsersUsecaseParams> {
  final GithubRepository _githubRepository;

  GetUsersUsecase(this._githubRepository);

  @override
  Future<Either<Failure, List<GithubUser>>> call(GetUsersUsecaseParams params) async {
    var result = await _githubRepository.getUsers(params.since, params.perPage);

    return result.fold((l) {
      log(l.message);
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}

class GetUsersUsecaseParams {
  final int since;
  final int perPage;

  GetUsersUsecaseParams(this.since, this.perPage);
}
