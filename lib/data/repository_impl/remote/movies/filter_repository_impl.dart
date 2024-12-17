import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/filter_datasource.dart';
import 'package:movies_app/domain/entities/movies/FilterEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/filter_repository.dart';

@Injectable(as: FilterRepository)
class FilterRepositoryImpl extends FilterRepository {
  FilterDataSource filterDataSource;
  @factoryMethod
  FilterRepositoryImpl(this.filterDataSource);
  @override
  Future<Either<List<FilterEntitie>, String>> filter(
      {required int categoryId,required String mediaType,required int page}) async {
    var result = await filterDataSource.filter(categoryId: categoryId, mediaType: mediaType,page: page);
    return result.fold((filter) {
      List<FilterEntitie> filterEntiteList =
          filter.results!.map((e) => e.toFilterEntite()).toList();
      return Left(filterEntiteList);
    }, (error) {
      return Right(error);
    });
  }
}
