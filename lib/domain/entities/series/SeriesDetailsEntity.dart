import 'package:movies_app/data/models/categories/Genres.dart';

class SeriesDetailsEntity {
  SeriesDetailsEntity(
      {this.backdropPath,
      this.firstAirDate,
      this.genres,
      this.id,
      this.name,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.overview,
      this.posterPath,
      this.seasons,
      this.voteAverage});

  SeriesDetailsEntity.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    if (json['seasons'] != null) {
      seasons = [];
      json['seasons'].forEach((v) {
        seasons?.add(Seasons.fromJson(v));
      });
    }
    voteAverage = json["vote_average"];
  }
  String? backdropPath;
  String? firstAirDate;
  List<Genres>? genres;
  num? id;
  String? name;
  num? numberOfEpisodes;
  num? numberOfSeasons;
  String? overview;
  String? posterPath;
  num? voteAverage;
  List<Seasons>? seasons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['first_air_date'] = firstAirDate;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['name'] = name;
    map['number_of_episodes'] = numberOfEpisodes;
    map['number_of_seasons'] = numberOfSeasons;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    if (seasons != null) {
      map['seasons'] = seasons?.map((v) => v.toJson()).toList();
    }
    map["vote_average"] = voteAverage;
    return map;
  }
}

class Seasons {
  Seasons({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  Seasons.fromJson(dynamic json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
    voteAverage = json['vote_average'];
  }
  String? airDate;
  num? episodeCount;
  num? id;
  String? name;
  String? overview;
  String? posterPath;
  num? seasonNumber;
  num? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = airDate;
    map['episode_count'] = episodeCount;
    map['id'] = id;
    map['name'] = name;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['season_number'] = seasonNumber;
    map['vote_average'] = voteAverage;
    return map;
  }
}
