import 'ReleaseDates.dart';

/// iso_3166_1 : "AU"
/// release_dates : [{"certification":"R18+","descriptors":[],"iso_639_1":"","note":"","release_date":"1983-05-06T00:00:00.000Z","type":3}]

class RateResults {
  RateResults({
    this.iso31661,
    this.releaseDates,
  });

  RateResults.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    if (json['release_dates'] != null) {
      releaseDates = [];
      json['release_dates'].forEach((v) {
        releaseDates?.add(ReleaseDates.fromJson(v));
      });
    }
  }
  String? iso31661;
  List<ReleaseDates>? releaseDates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    if (releaseDates != null) {
      map['release_dates'] = releaseDates?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
