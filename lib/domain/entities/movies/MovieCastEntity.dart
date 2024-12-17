class CastEntity {
  CastEntity({
    this.id,
    this.knownForDepartment,
    this.name,
    this.profilePath,
    this.castId,
    this.creditId,
  });

  CastEntity.fromJson(dynamic json) {
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    creditId = json['credit_id'];
  }
  num? id;
  String? knownForDepartment;
  String? name;
  String? profilePath;
  num? castId;
  String? creditId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['profile_path'] = profilePath;
    map['cast_id'] = castId;
    map['credit_id'] = creditId;
    return map;
  }
}
