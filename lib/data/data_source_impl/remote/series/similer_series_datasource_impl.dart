import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/series/similler_series_datasource.dart';
import 'package:movies_app/data/models/series/series_similler/SeriesSimillerResponse.dart';

@Injectable(as: SimillerSeriesDatasource)
class SimilerSeriesDatasourceImpl extends SimillerSeriesDatasource {
  ApiManger apiManger;
  SimilerSeriesDatasourceImpl(this.apiManger);

  @override
  Future<Either<SeriesSimillerResponse, String>> getSimilerSeries(
      {required num seriesId,required int page}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.simillerSeriesEndPoint(seriesId: seriesId),queryParameters: {
            "page":page
          });
      SeriesSimillerResponse seriesSimillerResponse =
          SeriesSimillerResponse.fromJson(response.data);
      return Left(seriesSimillerResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
