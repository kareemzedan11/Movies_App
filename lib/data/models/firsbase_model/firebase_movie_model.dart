/// backdrop_path : "/8RKBHHRqOMOLh5qW3sS6TSFTd8h.jpg"
/// id : 399579
/// release_date : "2019-01-31"
/// title : "Alita: Battle Angel"
library;

class FireBaseMovieModel {
  FireBaseMovieModel(
      {this.backdropPath,
      this.id,
      this.releaseDate,
      this.title,
      this.isSelected = true,
      this.mediaType,
      this.isArabicSeries = false});

  FireBaseMovieModel.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    releaseDate = json['release_date'];
    title = json['title'];
    isSelected = json['isSelected'];
    mediaType = json["media_type"];
    isArabicSeries = json["isArabicSeries"];
  }
  String? backdropPath;
  num? id;
  String? releaseDate;
  String? title;
  bool? isSelected;
  String? mediaType;
  bool? isArabicSeries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['isSelected'] = isSelected;
    map['media_type'] = mediaType;
    map["isArabicSeries"] = isArabicSeries;
    return map;
  }
}
