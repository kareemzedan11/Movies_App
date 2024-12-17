import 'package:movies_app/domain/entities/SearchEntity.dart';

class SearchResults {
  SearchResults({
    this.backdropPath,
    this.id,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.name,
    this.title,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  SearchResults.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    adult = json['adult'];
    name = json['name'];
    title = json['title'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    popularity = json['popularity'];
    firstAirDate = json['first_air_date'];
    releaseDate = json['release_date'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    originCountry = json['origin_country'] != null
        ? json['origin_country'].cast<String>()
        : [];
  }
  String? backdropPath;
  num? id;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? name;
  String? title;
  String? originalLanguage;
  List<num>? genreIds;
  num? popularity;
  String? releaseDate;
  String? firstAirDate;
  num? voteAverage;
  num? voteCount;
  List<String>? originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['original_name'] = originalName;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['adult'] = adult;
    map['name'] = name;
    map['title'] = title;
    map['original_language'] = originalLanguage;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['first_air_date'] = firstAirDate;
    map['release_date'] = releaseDate;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['origin_country'] = originCountry;
    return map;
  }

  SearchEntity toSearchEntity() {
    return SearchEntity(
      firstAirDate: firstAirDate,
      id: id,
      mediaType: mediaType,
      name: name,
      posterPath: posterPath,
      releaseDate: releaseDate,
      backdropPath:backdropPath,
    );
  }
}
