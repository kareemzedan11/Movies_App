import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/now_playing_datasource.dart';
import 'package:movies_app/domain/entities/movies/PopularEntitie.dart';

@injectable
class LastUpdatedViewModel extends Cubit<LastUpdatedViewModelState> {
  LastUpdatedViewModel(this.nowPlayingDatasource)
      : super(LastUpdatedViewModelInitial());
  @factoryMethod
  NowPlayingDatasource nowPlayingDatasource;
  static List<PopularEntitie> lastUpdatedList = [];
  getPopularDirectly() async {
      emit(LastUpdatedViewModelSuccess(lastUpdatedList));
    }
  

   getlastUpdatedMovies({required int page}) async {
    emit(LastUpdatedViewModelLoaded());
    var response = await nowPlayingDatasource.getNowPlaying(page: page);
    response.fold((result) {
      if (page == 1) {
        lastUpdatedList.clear();
      }
      lastUpdatedList.addAll(result);
      emit(LastUpdatedViewModelSuccess(lastUpdatedList));
    }, (error) {
      emit(LastUpdatedViewModelError(error));
    });
  }
}

abstract class LastUpdatedViewModelState {}

class LastUpdatedViewModelInitial extends LastUpdatedViewModelState {}

class LastUpdatedViewModelLoaded extends LastUpdatedViewModelState {}

class LastUpdatedViewModelError extends LastUpdatedViewModelState {
  String errorMassage;
  LastUpdatedViewModelError(this.errorMassage);
}

class LastUpdatedViewModelSuccess extends LastUpdatedViewModelState {
  List<PopularEntitie> lastUpdatedMovies;

  LastUpdatedViewModelSuccess(this.lastUpdatedMovies);
}