import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/PopularEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/popular_repository.dart';

@injectable
class PoplularUseCase {
  PopularRepository popularMovie;
  @factoryMethod
  PoplularUseCase(this.popularMovie);
  Future<Either<List<PopularEntitie>, String>> call({required int page}) {
    return popularMovie.getPopulerMovies(page: page);
  }
}
