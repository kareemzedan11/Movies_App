import 'Results.dart';

class MoviesReviewResponse {
  MoviesReviewResponse({
      this.id, 
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  MoviesReviewResponse.fromJson(dynamic json) {
    id = json['id'];
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? id;
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}