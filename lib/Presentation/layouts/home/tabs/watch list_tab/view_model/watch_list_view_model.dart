import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';
import 'package:movies_app/domain/use_cases/Local/fire_store_movie_use_case.dart';

@injectable
class WatchListTabViewModel extends Cubit<WatchListTabStates> {
  WatchListTabViewModel(this.fireStoreMovieUseCase)
      : super(WatchListTabInitialState());
  @factoryMethod
  FireStoreMovieUseCase fireStoreMovieUseCase;
  getFireStoreMovieAndSeries({required String userId}) async {
    emit(WatchListTabLoadingState());

    var result =
        await fireStoreMovieUseCase.callGetMovieAndSeries(userId: userId);
    result.fold(
      (response) async {
        emit(WatchListTabSuccessState(response));
      },
      (error) {
        emit(WatchListTabErrorState(error));
      },
    );
  }

  getFireStoreMovieOrSeries({required String userId,required String type}) async {
    emit(WatchListTabLoadingState());

    var result =
        await fireStoreMovieUseCase.callGetMovieOrSeries(userId: userId, type: type);
    result.fold(
      (response) async {
        emit(WatchListTabSuccessState(response));
      },
      (error) {
        emit(WatchListTabErrorState(error));
      },
    );
  }
}

abstract class WatchListTabStates {}

class WatchListTabInitialState extends WatchListTabStates {}

class WatchListTabLoadingState extends WatchListTabStates {}

class WatchListTabSuccessState extends WatchListTabStates {
  Stream<List<FireBaseMovieModel>> fireBaseMovies;
  WatchListTabSuccessState(this.fireBaseMovies);
}

class WatchListTabErrorState extends WatchListTabStates {
  String error;
  WatchListTabErrorState(this.error);
}