import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/similer_datasource.dart';
import 'package:movies_app/data/models/movies/similer_model/similar_response.dart';
@Injectable(as: SimilerDataSource)
class SimilerDataSourceImpl extends SimilerDataSource {
  ApiManger apiManger;
  @factoryMethod
  SimilerDataSourceImpl(this.apiManger);
  @override
  Future<Either<SimilarResponse, String>> getSimiler({required movieId,required int page}) async {
    try {
      var response =
          await apiManger.getRequest(endPoints: "/3/movie/$movieId/similar",queryParameters: {
            "page":page
          });
      SimilarResponse similarResponse = SimilarResponse.fromJson(response.data);
      return Left(similarResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
