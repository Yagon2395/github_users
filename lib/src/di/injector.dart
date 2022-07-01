import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:github_users/src/data/datasources/github_datasource.dart';
import 'package:github_users/src/data/repositories/github_repository_impl.dart';
import 'package:github_users/src/domain/repositories/github_repository.dart';
import 'package:github_users/src/domain/usecases/get_users_usecase.dart';
import 'package:github_users/src/presentation/github_users/bloc/github_users_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Datasources
  injector.registerSingleton<GithubDatasource>(
    GithubDatasource(injector()),
  );

  // Repositories
  injector.registerSingleton<GithubRepository>(
    GithubRepositoryImpl(injector()),
  );

  // Usecases
  injector.registerSingleton<GetUsersUsecase>(
    GetUsersUsecase(injector()),
  );

  // Blocs
  injector.registerFactory<GithubUsersBloc>(
    () => GithubUsersBloc(injector()),
  );
}
