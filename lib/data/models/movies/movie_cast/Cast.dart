import 'package:movies_app/domain/entities/movies/MovieCastEntity.dart';

class Cast {
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Cast.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }
  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  num? castId;
  String? character;
  String? creditId;
  num? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    map['cast_id'] = castId;
    map['character'] = character;
    map['credit_id'] = creditId;
    map['order'] = order;
    return map;
  }

  CastEntity toMovieCastEntity() {
    return CastEntity(
      castId: castId,
      creditId: creditId,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      profilePath: profilePath,
    );
  }
}
