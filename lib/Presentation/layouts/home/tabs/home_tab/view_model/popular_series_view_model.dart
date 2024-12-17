import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/series/popular_series_datasource.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';

@injectable
class PopularSeriesViewModel extends Cubit<PopularSeriesStates> {
  PopularSeriesViewModel(this.popularSeriesDatasource)
      : super(PopularSeriesInitialState());
  @factoryMethod
  PopularSeriesDatasource popularSeriesDatasource;
  static List<TopRatedSeriesEntity> popularList = [];
  getPopularDirectly() {
    emit(PopularSeriesSuccessState(popularList));
  }

  getPopular({required int page}) async {
    emit(PopularSeriesLoadingState());
    var result = await popularSeriesDatasource.getPopularSeries(page: page);
    result.fold((categories) {
      if (page == 1) {
        popularList.clear();
      }
      popularList.addAll(categories);
      emit(PopularSeriesSuccessState(categories));
    }, (error) {
      emit(PopularSeriesErrorState(error));
    });
  }
}

abstract class PopularSeriesStates {}

class PopularSeriesInitialState extends PopularSeriesStates {}

class PopularSeriesLoadingState extends PopularSeriesStates {}

class PopularSeriesSuccessState extends PopularSeriesStates {
  List<TopRatedSeriesEntity> categories;
  PopularSeriesSuccessState(this.categories);
}

class PopularSeriesErrorState extends PopularSeriesStates {
  String error;
  PopularSeriesErrorState(this.error);
}
