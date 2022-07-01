import 'package:dartz/dartz.dart';
import 'package:github_users/src/domain/failures/failures.dart';

import '../entities/entities.dart';

abstract class GithubRepository {
  Future<Either<Failure, List<GithubUser>>> getUsers(int since, int perPage);
}
