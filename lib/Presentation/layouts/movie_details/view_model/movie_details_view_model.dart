import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movies/rating/Results.dart';
import 'package:movies_app/domain/entities/movies/MovieDetailsEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/movies/movie_details_usecase.dart';
import 'package:movies_app/domain/use_cases/remote/movies/rate_usecase.dart';

@injectable
class MovieDetailsHomeTabViewModel extends Cubit<MovieDetailsHomeTabStates> {
  MovieDetailsHomeTabViewModel(this.movieDetailsUseCase, this.ratingUseCase)
      : super(MovieDetailsHomeTabInitialState());
  @factoryMethod
  MovieDetailsUseCase movieDetailsUseCase;
  RatingUseCase ratingUseCase;
  getMovieDetails({required num movieId}) async {
    emit(MovieDetailsHomeTabLoadingState());
    var result = await movieDetailsUseCase.call(movieId: movieId);
    var rate = await ratingUseCase.call(movieId: movieId);
    late List<RateResults> rateResults;

    rate.fold(
      (response) {
        rateResults = response;
      },
      (error) {
        emit(MovieDetailsHomeTabErrorState(error));
      },
    );
    result.fold(
      (details) {
        emit(MovieDetailsHomeTabSuccessState(details, rateResults));
      },
      (error) {
        emit(MovieDetailsHomeTabErrorState(error));
      },
    );
  }
}

abstract class MovieDetailsHomeTabStates {}

class MovieDetailsHomeTabInitialState extends MovieDetailsHomeTabStates {}

class MovieDetailsHomeTabLoadingState extends MovieDetailsHomeTabStates {}

class MovieDetailsHomeTabSuccessState extends MovieDetailsHomeTabStates {
  MovieDetailsEntitie details;
  List<RateResults> rate;
  MovieDetailsHomeTabSuccessState(this.details, this.rate);
}

class MovieDetailsHomeTabErrorState extends MovieDetailsHomeTabStates {
  String error;
  MovieDetailsHomeTabErrorState(this.error);
}
