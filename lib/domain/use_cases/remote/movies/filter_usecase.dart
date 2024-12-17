import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/FilterEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/filter_repository.dart';

@injectable
class FilterUseCase {
  FilterRepository filterRepository;
  FilterUseCase(this.filterRepository);
 Future<Either<List<FilterEntitie>, String>> call({required int categoryId,required String mediaType,required int page}) => filterRepository.filter(categoryId: categoryId, mediaType: mediaType,page: page);
}
