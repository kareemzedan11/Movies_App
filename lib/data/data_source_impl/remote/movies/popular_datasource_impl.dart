import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/popular_datasource.dart';
import 'package:movies_app/data/models/movies/popular_model/popular_response.dart';

@Injectable(as: PopularDataSource)
class PopularDataSourceImpl extends PopularDataSource {
  ApiManger apiManger;
  @factoryMethod
  PopularDataSourceImpl({required this.apiManger,});
  @override
  Future<Either<PopularResponse, String>> getPopulerSeries({required int page}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.populerEndPoint, queryParameters: {"page": page});

      PopularResponse populerMovieModel =
          PopularResponse.fromJson(response.data);
      return Left(populerMovieModel);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
