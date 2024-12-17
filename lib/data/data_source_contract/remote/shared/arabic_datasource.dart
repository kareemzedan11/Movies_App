import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/filter_model/FilterResponse.dart';

abstract class ArabicDatasource {
  Future<Either<FilterResponse, String>> getArabic(
      {required String mediaType, required int page});
}
