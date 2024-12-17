class FilterEntitie {
  FilterEntitie({
    this.adult,
    this.backdropPath,
    this.id,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.posterPath,
    this.name,
    this.firstAirDate,
  });

  FilterEntitie.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
    posterPath = json['poster_path'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
  }
  bool? adult;
  String? backdropPath;
  num? id;
  String? releaseDate;
  String? title;
  String? name;
  String? firstAirDate;
  num? voteAverage;
  String? posterPath;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    map['poster_path'] = posterPath;
    map['first_air_date'] = firstAirDate;
    map['name'] = name;
    return map;
  }
}
