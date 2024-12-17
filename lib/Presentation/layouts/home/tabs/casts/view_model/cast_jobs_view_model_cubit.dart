import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/cast/cast_jobs_datasource.dart';
import 'package:movies_app/domain/entities/cast/cast_jobs_entity.dart';

@injectable
class CastJobsViewModelCubit extends Cubit<CastJobsViewModelState> {
  CastJobsViewModelCubit(this.castJobsDatasource)
      : super(CastJobsViewModelInitial());
  @factoryMethod
  CastJobsDatasource castJobsDatasource;
  getCastJobs({required String castId}) async {
    var result = await castJobsDatasource.getCastJobs(castId: castId);
    result.fold((response) {
      List<CastJobsEntity> castJobsList = response.cast
              ?.map(
                (e) => e.toCastJobsEntity(),
              )
              .toList() ??
          [];
      emit(CastJobsViewModelSuccessState(castJobsList));
    }, (error) {
      emit(CastJobsViewModelErrorState(error));
    });
  }
}

class CastJobsViewModelState {}

final class CastJobsViewModelInitial extends CastJobsViewModelState {}

final class CastJobsViewModelSuccessState extends CastJobsViewModelState {
  List<CastJobsEntity> castJobsEntity;
  CastJobsViewModelSuccessState(this.castJobsEntity);
}

final class CastJobsViewModelLoadingState extends CastJobsViewModelState {}

final class CastJobsViewModelErrorState extends CastJobsViewModelState {
  String error;
  CastJobsViewModelErrorState(this.error);
}
