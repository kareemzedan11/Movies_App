import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/series/top_rated_series_data_source.dart';
import 'package:movies_app/data/models/series/top_rated_top_rated_series/TopRatedSeriesResponse.dart';

@Injectable(as: TopRatedSeriesDataSource)
class TopRatedSeriesDataSourceImpl extends TopRatedSeriesDataSource {
  ApiManger apiManger;
  @factoryMethod
  TopRatedSeriesDataSourceImpl(this.apiManger);
  @override
  Future<Either<TopRatedSeriesResponse, String>> getTopRatedSeries() async {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.topRatedSeriesEndPoint,
          queryParameters: {"page": 1});
      TopRatedSeriesResponse topRatedSeriesResponse =
          TopRatedSeriesResponse.fromJson(response.data);
      return Left(topRatedSeriesResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
