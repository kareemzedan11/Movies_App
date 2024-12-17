import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/shared/arabic_datasource.dart';
import 'package:movies_app/domain/entities/movies/FilterEntitie.dart';

@injectable
class ArabicSeriesViewModel extends Cubit<ArabicSeriesViewModelStates> {
  ArabicSeriesViewModel(this.arabicDatasource)
      : super(ArabicSeriesViewModelInitialState());
  @factoryMethod
  ArabicDatasource arabicDatasource;
  static List<FilterEntitie> arabicSeries = [];
  getArabicSeriesDirectly() {
    emit(ArabicSeriesViewModelSuccessState(arabicSeries));
  }

  getArabicSeries({
    required int page,
  }) async {
    emit(ArabicSeriesViewModelLoadingState());
    var result =
        await arabicDatasource.getArabic(mediaType: "tv", page: page);
    result.fold((categories) {
      if (page == 1) {
        arabicSeries.clear();
      }
      List<FilterEntitie> list = categories.results
              ?.map(
                (e) => e.toFilterEntite(),
              )
              .toList() ??
          [];
      arabicSeries.addAll(list);
      emit(ArabicSeriesViewModelSuccessState(list));
    }, (error) {
      emit(ArabicSeriesViewModelErrorState(error));
    });
  }
}

abstract class ArabicSeriesViewModelStates {}

class ArabicSeriesViewModelInitialState extends ArabicSeriesViewModelStates {}

class ArabicSeriesViewModelLoadingState extends ArabicSeriesViewModelStates {}

class ArabicSeriesViewModelSuccessState extends ArabicSeriesViewModelStates {
  List<FilterEntitie> categories;
  ArabicSeriesViewModelSuccessState(this.categories);
}

class ArabicSeriesViewModelErrorState extends ArabicSeriesViewModelStates {
  String error;
  ArabicSeriesViewModelErrorState(this.error);
}
