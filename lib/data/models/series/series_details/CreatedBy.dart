class CreatedBy {
  CreatedBy({
      this.id, 
      this.creditId, 
      this.name, 
      this.originalName, 
      this.gender, 
      this.profilePath,});

  CreatedBy.fromJson(dynamic json) {
    id = json['id'];
    creditId = json['credit_id'];
    name = json['name'];
    originalName = json['original_name'];
    gender = json['gender'];
    profilePath = json['profile_path'];
  }
  num? id;
  String? creditId;
  String? name;
  String? originalName;
  num? gender;
  String? profilePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['credit_id'] = creditId;
    map['name'] = name;
    map['original_name'] = originalName;
    map['gender'] = gender;
    map['profile_path'] = profilePath;
    return map;
  }

}