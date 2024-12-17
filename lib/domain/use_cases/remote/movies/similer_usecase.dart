import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/SimilerEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/similer_repository.dart';
@injectable
class SimilerUseCase {
  SimilerRepository similerRepository;
  @factoryMethod
   SimilerUseCase(this.similerRepository);
  Future<Either<List<SimilerEntitie>, String>> call({required num movieId,required int page}) {
   return similerRepository.getSimiler(movieId: movieId,page:page);
  }
}
