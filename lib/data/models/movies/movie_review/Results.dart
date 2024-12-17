
import '../../../../domain/entities/movies/MovieReviewEntity.dart' as MovieReviewEntity;
import 'AuthorDetails.dart';

class Results {
  Results({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  Results.fromJson(dynamic json) {
    author = json['author'];
    authorDetails = json['author_details'] != null
        ? AuthorDetails.fromJson(json['author_details'])
        : null;
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }
  String? author;
  AuthorDetails? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = author;
    if (authorDetails != null) {
      map['author_details'] = authorDetails?.toJson();
    }
    map['content'] = content;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['url'] = url;
    return map;
  }

  MovieReviewEntity.MovieReviewEntity toMovieReviewEntity() {
    return MovieReviewEntity.MovieReviewEntity(
      content: content,
    authorDetails: MovieReviewEntity.AuthorDetailsEntity(
      avatarPath: authorDetails?.avatarPath,
      username: authorDetails?.username,
    ),
    );
  }
}
