import 'Cast.dart';
import 'Crew.dart';

class CastJobsResponse {
  CastJobsResponse({
      this.cast, 
      this.crew, 
      this.id,});

  CastJobsResponse.fromJson(dynamic json) {
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(Crew.fromJson(v));
      });
    }
    id = json['id'];
  }
  List<Cast>? cast;
  List<Crew>? crew;
  num? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      map['crew'] = crew?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    return map;
  }

}