import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/movie_review_datasource.dart';
import 'package:movies_app/data/models/movies/movie_review/MoviesReviewResponse.dart';

@Injectable(as: MovieReviewDataSource)
class MovieReviewDatasourceImpl extends MovieReviewDataSource {
  ApiManger apiManger;
  @factoryMethod
  MovieReviewDatasourceImpl(this.apiManger);
  @override
  Future<Either<MoviesReviewResponse, String>> getMovieReview(
      {required num movieId}) async {
    try {
      var response= await apiManger.getRequest(endPoints: EndPoints.moviesReview(movieId: movieId));
    MoviesReviewResponse result = MoviesReviewResponse.fromJson(response.data);
    return Left(result);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
