import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/filter_datasource.dart';
import 'package:movies_app/data/models/filter_model/FilterResponse.dart';

@Injectable(as: FilterDataSource)
class FilterDataSourceImpl extends FilterDataSource {
  ApiManger apiManger;
  @factoryMethod
  FilterDataSourceImpl(this.apiManger);

  @override
  Future<Either<FilterResponse, String>> filter(
      {required int categoryId,required String mediaType,required int page}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.filterEndPoint(mediaType: mediaType),
          queryParameters: {"with_genres": categoryId,"page":page});
      FilterResponse filterResponse = FilterResponse.fromJson(response.data);
      return Left(filterResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
