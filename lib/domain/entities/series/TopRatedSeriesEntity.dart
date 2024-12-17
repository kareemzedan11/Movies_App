class TopRatedSeriesEntity {
  TopRatedSeriesEntity({
    this.backdropPath,
    this.id,
    this.posterPath,
    this.name,
    this.firstAirDate,
  });

  TopRatedSeriesEntity.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    posterPath = json['poster_path'];
    name = json['name'];
    firstAirDate = json['first_air_date'];
  }
  String? backdropPath;
  num? id;
  String? posterPath;
  String? name;
  String? firstAirDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['poster_path'] = posterPath;
    map['name'] = name;
    map['first_air_date'] = firstAirDate;
    return map;
  }
}
