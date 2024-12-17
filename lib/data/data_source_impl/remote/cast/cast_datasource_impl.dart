import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/cast/cast_datasource.dart';
import 'package:movies_app/data/models/movies/movie_cast/MovieCastResponse.dart';

@Injectable(as: CastDatasource)
class CastDatasourceImpl extends CastDatasource {
  ApiManger apiManger;
  @factoryMethod
  CastDatasourceImpl(this.apiManger);
  @override
  Future<Either<CastResponse, String>> getCast({required num mediaId}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.castEndPoint(movieId: mediaId));
      CastResponse castResponse = CastResponse.fromJson(response.data);
      return Left(castResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
