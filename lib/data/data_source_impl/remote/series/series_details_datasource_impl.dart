import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/series/series_details_datasource.dart';
import 'package:movies_app/data/models/series/series_details/SeriesDetailsRespnse.dart';

@Injectable(as: SeriesDetailsDatasource)
class SeriesDetailsDatasourceImpl extends SeriesDetailsDatasource {
  ApiManger apiManger;
  @factoryMethod
  SeriesDetailsDatasourceImpl(this.apiManger);
  @override
  Future<Either<SeriesDetailsRespnse, String>> getSeriesDetails(
      {required num seriesId,required int page}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.seriesDetailsEndPoint(seriesId: seriesId),queryParameters: {
            "page":page
          });
      SeriesDetailsRespnse seriesDetailsRespnse =
          SeriesDetailsRespnse.fromJson(response.data);
      return Left(seriesDetailsRespnse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
