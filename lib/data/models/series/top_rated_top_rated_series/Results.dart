import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';

/// adult : false
/// backdrop_path : "/9kyyQXy79YRdY5mhrYKyktbFMev.jpg"
/// genre_ids : [16,35,10765]
/// id : 94954
/// origin_country : ["US"]
/// original_language : "en"
/// original_name : "Hazbin Hotel"
/// overview : "In attempt to find a non-violent alternative for reducing Hell's overpopulation, the daughter of Lucifer opens a rehabilitation hotel that offers a group of misfit demons a chance at redemption."
/// popularity : 185.208
/// poster_path : "/rXojaQcxVUubPLSrFV8PD4xdjrs.jpg"
/// first_air_date : "2024-01-18"
/// name : "Hazbin Hotel"
/// vote_average : 8.981
/// vote_count : 960

class Results {
  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originCountry = json['origin_country'] != null
        ? json['origin_country'].cast<String>()
        : [];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  num? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  num? voteAverage;
  num? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['origin_country'] = originCountry;
    map['original_language'] = originalLanguage;
    map['original_name'] = originalName;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['first_air_date'] = firstAirDate;
    map['name'] = name;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

  TopRatedSeriesEntity toTopRatedSeriesEntity() {
    return TopRatedSeriesEntity(
      backdropPath: backdropPath,
      id: id,
      posterPath: posterPath,
      name: name,
      firstAirDate: firstAirDate,
    );
  }
}
