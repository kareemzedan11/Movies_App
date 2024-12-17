import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/shared/arabic_datasource.dart';
import 'package:movies_app/data/models/filter_model/FilterResponse.dart';

@Injectable(as: ArabicDatasource)
class ArabicDatasourceImpl extends ArabicDatasource {
  ApiManger apiManger;
  ArabicDatasourceImpl(this.apiManger);
  @override
  getArabic({required String mediaType, required int page}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.filterEndPoint(mediaType: mediaType),
          queryParameters: {
            "language": "ar",
            "page": page,
            "sort_by": "popularity.desc",
            "with_origin_country": "EG",
          });
      FilterResponse filterResponse = FilterResponse.fromJson(response.data);
      return Left(filterResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
