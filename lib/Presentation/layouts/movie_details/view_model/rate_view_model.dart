import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movies/rating/Results.dart';
import 'package:movies_app/domain/use_cases/remote/movies/rate_usecase.dart';

@injectable
class RateViewModel extends Cubit<RateStates> {
  RateViewModel( this.ratingUseCase)
      : super(RateInitialState());
  @factoryMethod
  RatingUseCase ratingUseCase;
  getMovieRate({required num movieId}) async {
    emit(RateLoadingState());
  
    var result = await ratingUseCase.call(movieId: movieId);

    result.fold(
      (response) {
        emit(RateSuccessState(response));
      },
      (error) {
        emit(RateErrorState(error));
      },
    );
   
  }
}

abstract class RateStates {}

class RateInitialState extends RateStates {}

class RateLoadingState extends RateStates {}

class RateSuccessState extends RateStates {
  List<RateResults> rate;
  RateSuccessState( this.rate);
}

class RateErrorState extends RateStates {
  String error;
  RateErrorState(this.error);
}
