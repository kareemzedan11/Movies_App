import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movies/rating/Results.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/rating_repository.dart';

@injectable
class RatingUseCase {
  RatingRepository ratingRepository;
  @factoryMethod
  RatingUseCase(this.ratingRepository);
  Future<Either<List<RateResults>, String>> call({required num movieId}) =>
      ratingRepository.getRate(movieId: movieId);
}
