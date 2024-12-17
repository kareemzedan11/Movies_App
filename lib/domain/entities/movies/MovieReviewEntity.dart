class MovieReviewEntity {
  MovieReviewEntity({
      this.authorDetails, 
      this.content,});

  MovieReviewEntity.fromJson(dynamic json) {
    authorDetails = json['author_details'] != null ? AuthorDetailsEntity.fromJson(json['author_details']) : null;
    content = json['content'];
  }
  AuthorDetailsEntity? authorDetails;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (authorDetails != null) {
      map['author_details'] = authorDetails?.toJson();
    }
    map['content'] = content;
    return map;
  }

}

class AuthorDetailsEntity {
  AuthorDetailsEntity({
      this.username, 
      this.avatarPath,});

  AuthorDetailsEntity.fromJson(dynamic json) {
    username = json['username'];
    avatarPath = json['avatar_path'];
  }
  String? username;
  String? avatarPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['avatar_path'] = avatarPath;
    return map;
  }

}