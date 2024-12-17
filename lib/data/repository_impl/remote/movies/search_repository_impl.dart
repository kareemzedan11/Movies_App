import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/search_datasource.dart';
import 'package:movies_app/data/models/movies/search_model/search_results.dart';
import 'package:movies_app/domain/entities/SearchEntity.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository {
  SearchDataSource searchDataSource;
  @factoryMethod
  SearchRepositoryImpl(this.searchDataSource);
  @override
  Future<Either<List<SearchEntity>, String>> search(
      {required String movieName}) async {
    var result = await searchDataSource.search(movieName: movieName);
    return result.fold((response) {
      List<SearchResults> resultList = response.results ?? [];
      List<SearchEntity> searchEntitieResult =
          resultList.map((e) => e.toSearchEntity()).toList();
      return Left(searchEntitieResult);
    }, (error) => Right(error));
  }
}
