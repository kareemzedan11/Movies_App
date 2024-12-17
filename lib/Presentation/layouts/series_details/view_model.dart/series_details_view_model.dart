import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/series/series_details_datasource.dart';
import 'package:movies_app/domain/entities/series/SeriesDetailsEntity.dart';

@injectable
class SeriesDetailsViewModel extends Cubit<SeriesDetailsViewModelState> {
  SeriesDetailsViewModel(this.seriesDetailsDatasource)
      : super(SeriesDetailsViewModelInitialState());
  @factoryMethod
  SeriesDetailsDatasource seriesDetailsDatasource;
  getMovieDetails({required num seriesId,required int page}) async {
    emit(SeriesDetailsViewModelLoadingState());
    var result =
        await seriesDetailsDatasource.getSeriesDetails(seriesId: seriesId,page:page);
    result.fold(
      (details) {
        SeriesDetailsEntity seriesDetailsEntity =
            details.toSeriesDetailsEntity();
        emit(SeriesDetailsViewModelSuccessState(seriesDetailsEntity));
      },
      (error) {
        emit(SeriesDetailsViewModelErrorState(error));
      },
    );
  }
}

abstract class SeriesDetailsViewModelState {}

class SeriesDetailsViewModelInitialState extends SeriesDetailsViewModelState {}

class SeriesDetailsViewModelLoadingState extends SeriesDetailsViewModelState {}

class SeriesDetailsViewModelSuccessState extends SeriesDetailsViewModelState {
  SeriesDetailsEntity details;
  SeriesDetailsViewModelSuccessState(this.details);
}

class SeriesDetailsViewModelErrorState extends SeriesDetailsViewModelState {
  String error;
  SeriesDetailsViewModelErrorState(this.error);
}
