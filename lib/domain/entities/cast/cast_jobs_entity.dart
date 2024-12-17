class CastJobsEntity {
  CastJobsEntity({
    this.backdropPath,
    this.id,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.mediaType,
    this.firstAirPath,
    this.name
  });

  CastJobsEntity.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    mediaType = json['media_type'];
    firstAirPath = json['first_air_path'];
    name = json['name'];
  }
  String? backdropPath;
  num? id;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? mediaType;
  String? firstAirPath;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['media_type'] = mediaType;
    map['first_air_path'] = firstAirPath;
    map['name'] = name;
    return map;
  }

}