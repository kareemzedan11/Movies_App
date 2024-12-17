import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/upcoming_datasource.dart';
import 'package:movies_app/data/models/movies/upcoming_model/UpcomingModel.dart';
import 'package:movies_app/domain/entities/movies/UpcomingEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/upcoming_repository.dart';

@Injectable(as: UpcomingRepository)
class UpcomingRepositoryImpl extends UpcomingRepository {
  UpcomingDataSorce upcomingDataSorce;
  @factoryMethod
  UpcomingRepositoryImpl(this.upcomingDataSorce);
  @override
  Future<Either<List<UpcomingEntitie>, String>> getUpcomingMovies() async {
    var result = await upcomingDataSorce.getUpcomingMovies();
    return result.fold((response) {
      List<UpcomingModel>? upcomingList = response.results;
      List<UpcomingEntitie> upcoming =
          upcomingList!.map((e) => e.toUpcomingEntitie()).toList();
      return Left(upcoming);
    }, (error) {
      return Right(error);
    });
  }
}
