class LastEpisodeToAir {
  LastEpisodeToAir({
      this.id, 
      this.name, 
      this.overview, 
      this.voteAverage, 
      this.voteCount, 
      this.airDate, 
      this.episodeNumber, 
      this.episodeType, 
      this.productionCode, 
      this.runtime, 
      this.seasonNumber, 
      this.showId, 
      this.stillPath,});

  LastEpisodeToAir.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    episodeType = json['episode_type'];
    productionCode = json['production_code'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = json['still_path'];
  }
  num? id;
  String? name;
  String? overview;
  num? voteAverage;
  num? voteCount;
  String? airDate;
  num? episodeNumber;
  String? episodeType;
  String? productionCode;
  num? runtime;
  num? seasonNumber;
  num? showId;
  String? stillPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['overview'] = overview;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['air_date'] = airDate;
    map['episode_number'] = episodeNumber;
    map['episode_type'] = episodeType;
    map['production_code'] = productionCode;
    map['runtime'] = runtime;
    map['season_number'] = seasonNumber;
    map['show_id'] = showId;
    map['still_path'] = stillPath;
    return map;
  }

}