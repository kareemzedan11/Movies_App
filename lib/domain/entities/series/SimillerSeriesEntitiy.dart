class SimillerSeriesEntitiy {
  SimillerSeriesEntitiy(
      {this.backdropPath,
      this.id,
      this.posterPath,
      this.firstAirDate,
      this.name});

  SimillerSeriesEntitiy.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    posterPath = json['poster_path'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
  }
  String? backdropPath;
  num? id;
  String? posterPath;
  String? firstAirDate;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['poster_path'] = posterPath;
    map['first_air_date'] = firstAirDate;
    map['naem'] = name;
    return map;
  }
}
