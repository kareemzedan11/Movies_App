import 'Cast.dart';
import 'Crew.dart';

class CastResponse {
  CastResponse({
    this.id,
    this.cast,
    this.crew,
  });

  CastResponse.fromJson(dynamic json) {
    id = json['id'];
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
  }
  num? id;
  List<Cast>? cast;
  List<Crew>? crew;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      map['crew'] = crew?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
