import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/series/series_details/SeriesDetailsRespnse.dart';

abstract class SeriesDetailsDatasource {
  Future<Either<SeriesDetailsRespnse, String>> getSeriesDetails(
      {required num seriesId,required int page});
}
