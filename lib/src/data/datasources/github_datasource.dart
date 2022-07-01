import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/github_user_model.dart';

part 'github_datasource.g.dart';

@RestApi(baseUrl: "https://api.github.com/")
abstract class GithubDatasource {
  factory GithubDatasource(Dio dio, {String baseUrl}) = _GithubDatasource;

  @GET("/users")
  Future<HttpResponse<List<GithubUserModel>>> getUsers(
    @Query("since") int since,
    @Query("per_page") int perPage,
  );
}
