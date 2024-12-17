class Seasons {
  Seasons({
      this.airDate, 
      this.episodeCount, 
      this.id, 
      this.name, 
      this.overview, 
      this.posterPath, 
      this.seasonNumber, 
      this.voteAverage,});

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