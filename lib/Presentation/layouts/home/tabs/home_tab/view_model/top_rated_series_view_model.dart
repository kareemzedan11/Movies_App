import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';
import 'package:movies_app/domain/use_cases/remote/series/top_rated_series_use_case.dart';

@injectable
class TopRatedSeriesViewModel extends Cubit<TopRatedSeriesStates> {
  TopRatedSeriesViewModel(this.topRatedUseCase)
      : super(TopRatedSeriesInitialState());
  @factoryMethod
  TopRatedSeriesUseCase topRatedUseCase;
  static List<TopRatedSeriesEntity> topRatedSeries = [];
  getTopRatedSeriesDirectly() {
    emit(TopRatedSeriesSuccessState(topRatedSeries));
  }

  getTopRatedSeries() async {
    emit(TopRatedSeriesLoadingState());
    var result = await topRatedUseCase.call();
    result.fold((topRated) {
      emit(TopRatedSeriesSuccessState(topRated));
    }, (error) {
      emit(TopRatedSeriesErrorState(error));
    });
  }
}

abstract class TopRatedSeriesStates {}

class TopRatedSeriesInitialState extends TopRatedSeriesStates {}

class TopRatedSeriesLoadingState extends TopRatedSeriesStates {}

class TopRatedSeriesSuccessState extends TopRatedSeriesStates {
  List<TopRatedSeriesEntity> topRated;
  TopRatedSeriesSuccessState(this.topRated);
}

class TopRatedSeriesErrorState extends TopRatedSeriesStates {
  String error;
  TopRatedSeriesErrorState(this.error);
}
