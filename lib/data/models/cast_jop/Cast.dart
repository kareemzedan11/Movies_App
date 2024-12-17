import 'package:movies_app/domain/entities/cast/cast_jobs_entity.dart';

class Cast {
  Cast(
      {this.adult,
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
      this.character,
      this.creditId,
      this.order,
      this.mediaType,
      this.firstAirPath,
      this.name});

  Cast.fromJson(dynamic json) {
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
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    mediaType = json['media_type'];
    firstAirPath = json['first_air_path'];
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
  bool? video;
  num? voteAverage;
  num? voteCount;
  String? character;
  String? creditId;
  num? order;
  String? mediaType;
  String? firstAirPath;
  String? name;

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
    map['character'] = character;
    map['credit_id'] = creditId;
    map['order'] = order;
    map['media_type'] = mediaType;
    map['first_air_path'] = firstAirPath;
    map['name'] = name;
    return map;
  }

  CastJobsEntity toCastJobsEntity() {
    return CastJobsEntity(backdropPath: backdropPath,
    firstAirPath: firstAirPath,
    id: id,
    mediaType: mediaType,
    name: name,
    posterPath: posterPath,
    releaseDate: releaseDate,
    title: title
    );
  }
}
