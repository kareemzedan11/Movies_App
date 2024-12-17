import 'package:movies_app/domain/entities/series/SeasonDetailsEntity.dart';

import 'Crew.dart';

class Episodes {
  Episodes({
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
    this.crew,
    this.guestStars,
  });

  Episodes.fromJson(dynamic json) {
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    episodeType = json['episode_type'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    productionCode = json['production_code'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = json['still_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(Crew.fromJson(v));
      });
    }
    if (json['guest_stars'] != null) {
      guestStars = [];
      json['guest_stars'].forEach((v) {
        guestStars?.add(GuestStars.fromJson(v));
      });
    }
  }
  String? airDate;
  num? episodeNumber;
  String? episodeType;
  num? id;
  String? name;
  String? overview;
  String? productionCode;
  num? runtime;
  num? seasonNumber;
  num? showId;
  String? stillPath;
  num? voteAverage;
  num? voteCount;
  List<Crew>? crew;
  List<GuestStars>? guestStars;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = airDate;
    map['episode_number'] = episodeNumber;
    map['episode_type'] = episodeType;
    map['id'] = id;
    map['name'] = name;
    map['overview'] = overview;
    map['production_code'] = productionCode;
    map['runtime'] = runtime;
    map['season_number'] = seasonNumber;
    map['show_id'] = showId;
    map['still_path'] = stillPath;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    if (crew != null) {
      map['crew'] = crew?.map((v) => v.toJson()).toList();
    }
    if (guestStars != null) {
      map['guest_stars'] = guestStars?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  SeasonDetailsEntity toSeasonDetailsEntity() {
    return SeasonDetailsEntity(
      guestStars: guestStars,
      id: id,
      name: name,
      overview: overview,
      stillPath: stillPath,
      voteAverage: voteAverage,
    );
  }
}
