/// iso_639_1 : "en"
/// iso_3166_1 : "US"
/// name : "Domestic Disturbance - Trailer"
/// key : "NZo72VgUAik"
/// published_at : "2013-04-30T02:34:31.000Z"
/// site : "YouTube"
/// size : 480
/// type : "Trailer"
/// official : true
/// id : "533ec66fc3a3685448001f54"
library;

import 'package:movies_app/domain/entities/movies/TraillerEntity.dart';

class TraillerModel {
  TraillerModel({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.publishedAt,
    this.site,
    this.size,
    this.type,
    this.official,
    this.id,
  });

  TraillerModel.fromJson(dynamic json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    publishedAt = json['published_at'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    id = json['id'];
  }
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? publishedAt;
  String? site;
  num? size;
  String? type;
  bool? official;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_639_1'] = iso6391;
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    map['key'] = key;
    map['published_at'] = publishedAt;
    map['site'] = site;
    map['size'] = size;
    map['type'] = type;
    map['official'] = official;
    map['id'] = id;
    return map;
  }

  TraillerEntity toTraillerEntity() {
    return TraillerEntity(
      key: key,
    );
  }
}
