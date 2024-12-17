import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/SearchEntity.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/search_repository.dart';

@injectable
class SearchUseCase {
  SearchRepository searchRepository;
  @factoryMethod
  SearchUseCase(this.searchRepository);
  Future<Either<List<SearchEntity>, String>> call({required String movieName}) =>
      searchRepository.search(movieName: movieName);
}
