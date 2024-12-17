import 'Trailler_model.dart';

/// id : 11456
/// results : [{"iso_639_1":"en","iso_3166_1":"US","name":"Domestic Disturbance - Trailer","key":"NZo72VgUAik","published_at":"2013-04-30T02:34:31.000Z","site":"YouTube","size":480,"type":"Trailer","official":true,"id":"533ec66fc3a3685448001f54"}]

class TraillerResponse {
  TraillerResponse({
    this.id,
    this.results,
  });

  TraillerResponse.fromJson(dynamic json) {
    id = json['id'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(TraillerModel.fromJson(v));
      });
    }
  }
  num? id;
  List<TraillerModel>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
