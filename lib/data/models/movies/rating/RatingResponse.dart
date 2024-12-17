import 'Results.dart';

/// id : 150
/// results : [{"iso_3166_1":"AU","release_dates":[{"certification":"R18+","descriptors":[],"iso_639_1":"","note":"","release_date":"1983-05-06T00:00:00.000Z","type":3}]},{"iso_3166_1":"BR","release_dates":[{"certification":"14","descriptors":[],"iso_639_1":"","note":"","release_date":"1983-02-17T00:00:00.000Z","type":3}]},{"iso_3166_1":"DE","release_dates":[{"certification":"16","descriptors":[],"iso_639_1":"","note":"","release_date":"1982-12-07T00:00:00.000Z","type":3}]},{"iso_3166_1":"DK","release_dates":[{"certification":"15","descriptors":[],"iso_639_1":"","note":"","release_date":"1983-04-15T00:00:00.000Z","type":3}]},{"iso_3166_1":"ES","release_dates":[{"certification":"16","descriptors":[],"iso_639_1":"es","note":"","release_date":"1983-04-13T00:00:00.000Z","type":3}]},{"iso_3166_1":"FR","release_dates":[{"certification":"TP","descriptors":[],"iso_639_1":"","note":"","release_date":"1983-04-27T00:00:00.000Z","type":3},{"certification":"TP","descriptors":[],"iso_639_1":"","note":"Prime Video","release_date":"2021-06-01T00:00:00.000Z","type":4},{"certification":"","descriptors":[],"iso_639_1":"","note":"VOD","release_date":"2020-04-28T00:00:00.000Z","type":4},{"certification":"TP","descriptors":[],"iso_639_1":"","note":"DVD","release_date":"2000-08-24T00:00:00.000Z","type":5},{"certification":"TP","descriptors":[],"iso_639_1":"","note":"Blu-Ray","release_date":"2021-07-07T00:00:00.000Z","type":5},{"certification":"","descriptors":[],"iso_639_1":"","note":"VHS","release_date":"1990-08-21T00:00:00.000Z","type":5}]},{"iso_3166_1":"GB","release_dates":[{"certification":"18","descriptors":[],"iso_639_1":"","note":"","release_date":"1982-12-14T00:00:00.000Z","type":3}]},{"iso_3166_1":"HU","release_dates":[{"certification":"18","descriptors":[],"iso_639_1":"","note":"","release_date":"1987-09-03T00:00:00.000Z","type":3}]},{"iso_3166_1":"IE","release_dates":[{"certification":"15","descriptors":[],"iso_639_1":"","note":"","release_date":"1983-06-24T00:00:00.000Z","type":3}]},{"iso_3166_1":"JP","release_dates":[{"certification":"","descriptors":[],"iso_639_1":"","note":"","release_date":"1983-10-29T00:00:00.000Z","type":3}]},{"iso_3166_1":"KR","release_dates":[{"certification":"18","descriptors":[],"iso_639_1":"","note":"","release_date":"1984-01-01T00:00:00.000Z","type":3}]},{"iso_3166_1":"NL","release_dates":[{"certification":"12","descriptors":[],"iso_639_1":"","note":"","release_date":"1983-05-11T00:00:00.000Z","type":3},{"certification":"12","descriptors":[],"iso_639_1":"","note":"DVD","release_date":"2001-01-14T00:00:00.000Z","type":5},{"certification":"12","descriptors":[],"iso_639_1":"","note":"Blu ray","release_date":"2013-11-20T00:00:00.000Z","type":5},{"certification":"12","descriptors":[],"iso_639_1":"","note":"V8","release_date":"2002-03-04T00:00:00.000Z","type":6}]},{"iso_3166_1":"SE","release_dates":[{"certification":"15","descriptors":[],"iso_639_1":"","note":"","release_date":"1983-03-04T00:00:00.000Z","type":3},{"certification":"15","descriptors":[],"iso_639_1":"","note":"DVD release","release_date":"2000-09-06T00:00:00.000Z","type":5}]},{"iso_3166_1":"US","release_dates":[{"certification":"R","descriptors":[],"iso_639_1":"","note":"","release_date":"1982-12-07T00:00:00.000Z","type":3}]}]

class RatingResponse {
  RatingResponse({
    this.id,
    this.results,
  });

  RatingResponse.fromJson(dynamic json) {
    id = json['id'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(RateResults.fromJson(v));
      });
    }
  }
  num? id;
  List<RateResults>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
