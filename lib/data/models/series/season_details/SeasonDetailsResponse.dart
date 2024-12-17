
import 'package:movies_app/data/models/series/season_details/Episodes.dart';

class SeasonDetailsResponse {
  SeasonDetailsResponse({
      this.id2, 
      this.airDate, 
      this.episodes, 
      this.name, 
      this.overview, 
      this.id, 
      this.posterPath, 
      this.seasonNumber, 
      this.voteAverage,});

  SeasonDetailsResponse.fromJson(dynamic json) {
    id2 = json['_id'];
    airDate = json['air_date'];
    if (json['episodes'] != null) {
      episodes = [];
      json['episodes'].forEach((v) {
        episodes?.add(Episodes.fromJson(v));
      });
    }
    name = json['name'];
    overview = json['overview'];
    id = json['id'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
    voteAverage = json['vote_average'];
  }
  String? id2;
  String? airDate;
  List<Episodes>? episodes;
  String? name;
  String? overview;
  num? id;
  String? posterPath;
  num? seasonNumber;
  num? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['air_date'] = airDate;
    if (episodes != null) {
      map['episodes'] = episodes?.map((v) => v.toJson()).toList();
    }
    map['name'] = name;
    map['overview'] = overview;
    map['id'] = id;
    map['poster_path'] = posterPath;
    map['season_number'] = seasonNumber;
    map['vote_average'] = voteAverage;
    return map;
  }

}