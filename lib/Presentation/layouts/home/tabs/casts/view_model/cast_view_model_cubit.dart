import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/cast/cast_datasource.dart';
import 'package:movies_app/domain/entities/movies/MovieCastEntity.dart';

@injectable
class CastViewModelCubit extends Cubit<CastViewModelState> {
  CastViewModelCubit(this.castDatasource) : super(MovieCastViewModelInitial());
  @factoryMethod
  CastDatasource castDatasource;
  getMovieCast({required num mediaId}) async {
    emit(CastViewModelLoadingState());
    var result = await castDatasource.getCast(mediaId: mediaId);
    result.fold((response) {
      List<CastEntity> castList = response.cast
              ?.where(
            (element) => element.knownForDepartment == "Acting",
          )
              .map((e) {
            return e.toMovieCastEntity();
          }).toList() ??
          [];
      emit(CastViewModelSuccessState(castList));
    }, (error) {
      emit(CastViewModelErrorState(error));
    });
  }
}

abstract class CastViewModelState {}

final class MovieCastViewModelInitial extends CastViewModelState {}

final class CastViewModelSuccessState extends CastViewModelState {
  List<CastEntity> movieCastEntity;
  CastViewModelSuccessState(this.movieCastEntity);
}

final class CastViewModelLoadingState extends CastViewModelState {}

final class CastViewModelErrorState extends CastViewModelState {
  String error;
  CastViewModelErrorState(this.error);
}
