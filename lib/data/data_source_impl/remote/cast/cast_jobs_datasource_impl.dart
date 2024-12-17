import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/cast/cast_jobs_datasource.dart';
import 'package:movies_app/data/models/cast_jop/CastJopsResponse.dart';

@Injectable(as: CastJobsDatasource)
class CastJobsDatasourceImpl extends CastJobsDatasource {
  ApiManger apiManger;
  @factoryMethod
  CastJobsDatasourceImpl(this.apiManger);

  @override
  Future<Either<CastJobsResponse, String>> getCastJobs(
      {required String castId}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.castMoviesAndSeriesEndPoint(castId: castId));
      CastJobsResponse castJobsResponse =
          CastJobsResponse.fromJson(response.data);
      return Left(castJobsResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
