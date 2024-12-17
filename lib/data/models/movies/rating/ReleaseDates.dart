/// certification : "R18+"
/// descriptors : []
/// iso_639_1 : ""
/// note : ""
/// release_date : "1983-05-06T00:00:00.000Z"
/// type : 3
library;

class ReleaseDates {
  ReleaseDates({
    this.certification,
    this.iso6391,
    this.note,
    this.releaseDate,
    this.type,
  });

  ReleaseDates.fromJson(dynamic json) {
    certification = json['certification'];
    iso6391 = json['iso_639_1'];
    note = json['note'];
    releaseDate = json['release_date'];
    type = json['type'];
  }
  String? certification;
  String? iso6391;
  String? note;
  String? releaseDate;
  num? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['certification'] = certification;
    map['iso_639_1'] = iso6391;
    map['note'] = note;
    map['release_date'] = releaseDate;
    map['type'] = type;
    return map;
  }
}
