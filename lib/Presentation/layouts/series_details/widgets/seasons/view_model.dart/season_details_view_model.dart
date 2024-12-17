import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/series/season_details_datasource.dart';
import 'package:movies_app/domain/entities/series/SeasonDetailsEntity.dart';

@injectable
class SeasonDetailsViewModel extends Cubit<SeasonDetailsViewModelState> {
  SeasonDetailsViewModel(this.seasonDetailsDatasource)
      : super(SeasonDetailsViewModelInitialState());
  @factoryMethod
  SeasonDetailsDatasource seasonDetailsDatasource;
  getSeasons({required num seriesId, required num seasonNumber}) async {
    emit(SeasonDetailsViewModelLoadingState());
    var response = await seasonDetailsDatasource.getSeasons(
        seriesId: seriesId, seasonNumber: seasonNumber);
    response.fold((result) {
      List<SeasonDetailsEntity> seasonDetailsEntity = result.episodes?.map(
        (e) => e.toSeasonDetailsEntity(),
      ).toList()??[];
      log(seasonDetailsEntity[0].name ?? "fuck your ass");
      emit(SeasonDetailsViewModelSuccessState(seasonDetailsEntity));
    }, (error) {
      log(error);
      emit(SeasonDetailsViewModelErrorState(error));
    });
  }
}

abstract class SeasonDetailsViewModelState {}

class SeasonDetailsViewModelInitialState extends SeasonDetailsViewModelState {}

class SeasonDetailsViewModelLoadingState extends SeasonDetailsViewModelState {}

class SeasonDetailsViewModelSuccessState extends SeasonDetailsViewModelState {
  List<SeasonDetailsEntity> seasonDetailsEntity;
  SeasonDetailsViewModelSuccessState(this.seasonDetailsEntity);
}

class SeasonDetailsViewModelErrorState extends SeasonDetailsViewModelState {
  String error;
  SeasonDetailsViewModelErrorState(this.error);
}
