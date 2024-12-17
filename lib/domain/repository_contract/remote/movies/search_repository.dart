import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/SearchEntity.dart';

abstract class SearchRepository {
  Future<Either<List<SearchEntity>, String>> search({required String movieName});
}