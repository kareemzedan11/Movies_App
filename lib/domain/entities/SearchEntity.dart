class SearchEntity {
  SearchEntity(
      {this.id,
      this.posterPath,
      this.mediaType,
      this.name,
      this.title,
      this.releaseDate,
      this.firstAirDate,
      this.backdropPath});

  SearchEntity.fromJson(dynamic json) {
    id = json['id'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    name = json['name'];
    title = json["title"];
    releaseDate = json['release_date'];
    firstAirDate = json['first_air_date'];
    backdropPath = json["backdrop_path"];
  }
  num? id;
  String? posterPath;
  String? mediaType;
  String? name;
  String? title;
  String? releaseDate;
  String? firstAirDate;
  String? backdropPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['name'] = name;
    map["title"] = title;
    map['release_date'] = releaseDate;
    map['first_air_date'] = firstAirDate;
    map["backdrop_path"] = backdropPath;
    return map;
  }
}
