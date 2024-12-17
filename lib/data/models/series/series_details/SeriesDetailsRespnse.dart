import 'package:movies_app/data/models/categories/Genres.dart';
import 'package:movies_app/domain/entities/series/SeriesDetailsEntity.dart';

import 'CreatedBy.dart';
import 'LastEpisodeToAir.dart';
import 'Networks.dart';
import 'ProductionCompanies.dart';
import 'ProductionCountries.dart';
import 'SpokenLanguages.dart';

class SeriesDetailsRespnse {
  SeriesDetailsRespnse({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  SeriesDetailsRespnse.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      createdBy = [];
      json['created_by'].forEach((v) {
        createdBy?.add(CreatedBy.fromJson(v));
      });
    }
    episodeRunTime = json['episode_run_time'] != null
        ? json['episode_run_time'].cast<num>()
        : [];
    firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    inProduction = json['in_production'];
    languages =
        json['languages'] != null ? json['languages'].cast<String>() : [];
    lastAirDate = json['last_air_date'];
    lastEpisodeToAir = json['last_episode_to_air'] != null
        ? LastEpisodeToAir.fromJson(json['last_episode_to_air'])
        : null;
    name = json['name'];
    nextEpisodeToAir = json['next_episode_to_air'];
    if (json['networks'] != null) {
      networks = [];
      json['networks'].forEach((v) {
        networks?.add(Networks.fromJson(v));
      });
    }
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originCountry = json['origin_country'] != null
        ? json['origin_country'].cast<String>()
        : [];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = [];
      json['seasons'].forEach((v) {
        seasons?.add(Seasons.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<CreatedBy>? createdBy;
  List<num>? episodeRunTime;
  String? firstAirDate;
  List<Genres>? genres;
  String? homepage;
  num? id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  dynamic nextEpisodeToAir;
  List<Networks>? networks;
  num? numberOfEpisodes;
  num? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  List<Seasons>? seasons;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  num? voteAverage;
  num? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    if (createdBy != null) {
      map['created_by'] = createdBy?.map((v) => v.toJson()).toList();
    }
    map['episode_run_time'] = episodeRunTime;
    map['first_air_date'] = firstAirDate;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['in_production'] = inProduction;
    map['languages'] = languages;
    map['last_air_date'] = lastAirDate;
    if (lastEpisodeToAir != null) {
      map['last_episode_to_air'] = lastEpisodeToAir?.toJson();
    }
    map['name'] = name;
    map['next_episode_to_air'] = nextEpisodeToAir;
    if (networks != null) {
      map['networks'] = networks?.map((v) => v.toJson()).toList();
    }
    map['number_of_episodes'] = numberOfEpisodes;
    map['number_of_seasons'] = numberOfSeasons;
    map['origin_country'] = originCountry;
    map['original_language'] = originalLanguage;
    map['original_name'] = originalName;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] =
          productionCountries?.map((v) => v.toJson()).toList();
    }
    if (seasons != null) {
      map['seasons'] = seasons?.map((v) => v.toJson()).toList();
    }
    if (spokenLanguages != null) {
      map['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['type'] = type;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

  SeriesDetailsEntity toSeriesDetailsEntity() {
    return SeriesDetailsEntity(
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      genres: genres,
      id: id,
      name: name,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      overview: overview,
      posterPath: posterPath,
      seasons: seasons,
      voteAverage: voteAverage,
    );
  }
}
