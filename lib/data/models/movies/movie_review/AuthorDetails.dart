class AuthorDetails {
  AuthorDetails({
      this.name, 
      this.username, 
      this.avatarPath, 
      this.rating,});

  AuthorDetails.fromJson(dynamic json) {
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'];
    rating = json['rating'];
  }
  String? name;
  String? username;
  String? avatarPath;
  num? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['username'] = username;
    map['avatar_path'] = avatarPath;
    map['rating'] = rating;
    return map;
  }

}