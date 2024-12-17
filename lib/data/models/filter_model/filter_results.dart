/// adult : false
/// backdrop_path : "/atPlFdUrQl2U9MtUwujrrjnQHBA.jpg"
/// genre_ids : [28,80,18,53]
/// id : 654739
/// original_language : "ko"
/// original_title : "발신제한"
/// overview : "On his way to work, a bank manager receives an anonymous call claiming there's a bomb under his car seat, and if anyone exits the car, it will explode unless he can pay a ransom."
/// popularity : 750.876
/// poster_path : "/y2Aimt8isimtigec3e4kB2G9FMR.jpg"
/// release_date : "2021-06-23"
/// title : "Hard Hit"
/// video : false
/// vote_average : 7.7
/// vote_count : 165
library;

import 'package:movies_app/domain/entities/movies/FilterEntitie.dart';

class FilterResults {
  FilterResults({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.firstAirDate,
    this.name,
  });

  FilterResults.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
  }
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;

  String? name;
  String? firstAirDate;
  bool? video;
  num? voteAverage;
  num? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['first_air_date'] = firstAirDate;
    map['name'] = name;
    return map;
  }

  FilterEntitie toFilterEntite() {
    return FilterEntitie(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      releaseDate: releaseDate,
      title: title,
      voteAverage: voteAverage,
      posterPath: posterPath,
      firstAirDate: firstAirDate,
      name: name,
    );
  }
}
