import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/cast_jop/CastJopsResponse.dart';

abstract class CastJobsDatasource {
  Future<Either<CastJobsResponse, String>> getCastJobs(
      {required String castId});
}
