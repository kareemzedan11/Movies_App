import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/series/season_details_datasource.dart';
import 'package:movies_app/data/models/series/season_details/SeasonDetailsResponse.dart';

@Injectable(as: SeasonDetailsDatasource)
class SeasonDetailsDatasourceImpl extends SeasonDetailsDatasource {
  ApiManger apiManger;
  @factoryMethod
  SeasonDetailsDatasourceImpl(this.apiManger);
  @override
  Future<Either<SeasonDetailsResponse, String>> getSeasons(
      {required num seriesId, required num seasonNumber}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.seriesSeasonEndPoint(
              seriesId: seriesId, seasonNumber: seasonNumber));
      SeasonDetailsResponse seasonDetailsResponse =
          SeasonDetailsResponse.fromJson(response.data);
      return Left(seasonDetailsResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
