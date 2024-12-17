import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/series/popular_series_datasource.dart';
import 'package:movies_app/data/models/series/top_rated_top_rated_series/TopRatedSeriesResponse.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';

@Injectable(as: PopularSeriesDatasource)
class PopularSeriesDatasourceImpl extends PopularSeriesDatasource {
  ApiManger apiManger;
  @factoryMethod
  PopularSeriesDatasourceImpl(this.apiManger);

  @override
  Future<Either<List<TopRatedSeriesEntity>, String>> getPopularSeries({required int page}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.popularSeriesEndPoint,queryParameters: {
            "page":page
          });
      List<TopRatedSeriesEntity> topRatedSeriesResponse =
          TopRatedSeriesResponse.fromJson(response.data)
                  .results
                  ?.map(
                    (e) => e.toTopRatedSeriesEntity(),
                  )
                  .toList() ??
              [];
      return Left(topRatedSeriesResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
