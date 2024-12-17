class SeasonDetailsEntity {
  SeasonDetailsEntity({
      this.id, 
      this.name, 
      this.overview, 
      this.stillPath, 
      this.voteAverage, 
      this.guestStars,});

  SeasonDetailsEntity.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    stillPath = json['still_path'];
    voteAverage = json['vote_average'];
    if (json['guest_stars'] != null) {
      guestStars = [];
      json['guest_stars'].forEach((v) {
        guestStars?.add(GuestStars.fromJson(v));
      });
    }
  }
  num? id;
  String? name;
  String? overview;
  String? stillPath;
  num? voteAverage;
  List<GuestStars>? guestStars;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['overview'] = overview;
    map['still_path'] = stillPath;
    map['vote_average'] = voteAverage;
    if (guestStars != null) {
      map['guest_stars'] = guestStars?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class GuestStars {
  GuestStars({
      this.character, 
      this.creditId, 
      this.order, 
      this.adult, 
      this.gender, 
      this.id, 
      this.knownForDepartment, 
      this.name, 
      this.originalName, 
      this.popularity, 
      this.profilePath,});

  GuestStars.fromJson(dynamic json) {
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }
  String? character;
  String? creditId;
  num? order;
  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['character'] = character;
    map['credit_id'] = creditId;
    map['order'] = order;
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    return map;
  }

}