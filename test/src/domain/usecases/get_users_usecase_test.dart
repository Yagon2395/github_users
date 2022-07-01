import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/src/domain/entities/entities.dart';
import 'package:github_users/src/domain/repositories/github_repository.dart';
import 'package:github_users/src/domain/usecases/get_users_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockGithubRepository extends Mock implements GithubRepository {}

void main() {
  late GithubRepository githubRepository;
  late GetUsersUsecase getUsersUsecase;
  final List<GithubUser> users = [
    const GithubUser(avatar_url: 'teste', id: 1, node_id: 'ssss', url: 'teste', login: 'teste'),
    const GithubUser(avatar_url: 'teste2', id: 2, node_id: 'ssss2', url: 'teste2', login: 'teste2'),
  ];

  setUp(() {
    githubRepository = MockGithubRepository();
    getUsersUsecase = GetUsersUsecase(githubRepository);
  });

  setUpAll(() {
    registerFallbackValue(users);
  });

  test('should return a list of github users when passing no params to usecase', () async {
    when(() => githubRepository.getUsers(any(), any())).thenAnswer((_) => Future.value(Right(users)));

    var result = await getUsersUsecase(GetUsersUsecaseParams(0, 30));

    expect(result, Right(users));
  });
}
