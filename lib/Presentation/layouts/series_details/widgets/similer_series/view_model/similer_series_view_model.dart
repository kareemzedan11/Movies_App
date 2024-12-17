import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/series/similler_series_datasource.dart';
import 'package:movies_app/domain/entities/series/SimillerSeriesEntitiy.dart';

@injectable
class SimilerSeriesViewModel extends Cubit<SimilerSeriesViewModelStates> {
  SimilerSeriesViewModel(this.simillerSeriesDatasource)
      : super(SimilerSeriesViewModelInitialState());

  final SimillerSeriesDatasource simillerSeriesDatasource;
  static List<SimillerSeriesEntitiy> similerSeries = [];
  static bool hasMore = true;

  Future<void> getSimiler({required num seriesId, required int page}) async {
    if (page == 1) {
      similerSeries.clear();
      hasMore = true;
      emit(SimilerSeriesViewModelLoadingState());
    } else {
      emit(SimilerSeriesViewModelLoadingMoreState());
    }

    var result = await simillerSeriesDatasource.getSimilerSeries(
        seriesId: seriesId, page: page);

    result.fold((similer) {
      List<SimillerSeriesEntitiy> simillerSeriesEntitiy = similer.results
              ?.map(
                (e) => e.toSimillerSeriesEntitiy(),
              )
              .toList() ??
          [];

      if (simillerSeriesEntitiy.isEmpty) {
        hasMore = false;
      } else {
        similerSeries.addAll(simillerSeriesEntitiy);
      }

      emit(SimilerSeriesViewModelSuccessState(
          List<SimillerSeriesEntitiy>.from(similerSeries)));
    }, (error) {
      emit(SimilerSeriesViewModelErrorState(error));
    });
  }
}

abstract class SimilerSeriesViewModelStates {}

class SimilerSeriesViewModelInitialState extends SimilerSeriesViewModelStates {}

class SimilerSeriesViewModelLoadingState extends SimilerSeriesViewModelStates {}

class SimilerSeriesViewModelLoadingMoreState
    extends SimilerSeriesViewModelStates {}

class SimilerSeriesViewModelSuccessState extends SimilerSeriesViewModelStates {
  final List<SimillerSeriesEntitiy> similer;
  SimilerSeriesViewModelSuccessState(this.similer);
}

class SimilerSeriesViewModelErrorState extends SimilerSeriesViewModelStates {
  final String error;
  SimilerSeriesViewModelErrorState(this.error);
}
