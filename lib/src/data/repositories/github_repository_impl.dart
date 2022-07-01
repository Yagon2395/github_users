import 'package:dio/dio.dart';
import 'package:github_users/src/data/datasources/github_datasource.dart';
import 'package:github_users/src/domain/failures/failures.dart';
import 'package:github_users/src/domain/entities/github_user.dart';
import 'package:dartz/dartz.dart';
import 'package:github_users/src/domain/repositories/github_repository.dart';
import 'package:logger/logger.dart';

class GithubRepositoryImpl implements GithubRepository {
  final GithubDatasource datasource;
  final logger = Logger();

  GithubRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<GithubUser>>> getUsers(int since, int perPage) async {
    try {
      final httpResponse = await datasource.getUsers(since, perPage);

      if (httpResponse.response.statusCode != 200) {
        return Left(ServerFailure(
          "${httpResponse.response.statusMessage}",
          httpResponse.response.statusCode,
        ));
      }

      logger.i(httpResponse.data);
      return Right(httpResponse.data);
    } on DioError catch (error) {
      logger.i(('${error.message} => ${error.response?.statusMessage}'));
      return Left(ServerFailure(
        'Houve um problema ao se conectar com o servidor.',
        error.response?.statusCode,
      ));
    } catch (error) {
      logger.i(error.toString());
      return const Left(UnknownFailure(
        message: 'Houve um problema ao se conectar com o servidor.',
      ));
    }
  }
}
