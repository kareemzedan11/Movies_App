import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/trailler_datasource.dart';
import 'package:movies_app/data/models/movies/trailler/TraillerResponse.dart';

@Injectable(as: TraillerDataSource)
class TraillerDataSourceImpl extends TraillerDataSource {
  ApiManger apiManger;
  @factoryMethod
  TraillerDataSourceImpl(this.apiManger);
  @override
  Future<Either<TraillerResponse, String>> getTrailler(
      {required num movieId,required String mediaType}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.videoTrailler(movieId: movieId, mediaType: mediaType));
      TraillerResponse result = TraillerResponse.fromJson(response.data);
      return Left(result);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
