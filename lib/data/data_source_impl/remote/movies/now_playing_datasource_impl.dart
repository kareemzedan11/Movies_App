import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/now_playing_datasource.dart';
import 'package:movies_app/data/models/movies/popular_model/popular_response.dart';
import 'package:movies_app/domain/entities/movies/PopularEntitie.dart';

@Injectable(as: NowPlayingDatasource)
class NowPlayingDatasourceImpl extends NowPlayingDatasource {
  ApiManger apiManger;
  @factoryMethod
  NowPlayingDatasourceImpl(this.apiManger);
  @override
  Future<Either<List<PopularEntitie>, String>> getNowPlaying(
      {required int page}) async {
    try {
      var response = await apiManger.getRequest(
        endPoints: EndPoints.nowPlayingEndPoint,
        queryParameters: {
          "page": page,
        },
      );
      List<PopularEntitie> nowPlaying = PopularResponse.fromJson(response.data)
              .results
              ?.map(
                (e) => e.toPopularEntitie(),
              )
              .toList() ??
          [];
      return Left(nowPlaying);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
