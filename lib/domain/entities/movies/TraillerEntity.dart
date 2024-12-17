/// key : "NZo72VgUAik"
library;

class TraillerEntity {
  TraillerEntity({
      this.key,});

  TraillerEntity.fromJson(dynamic json) {
    key = json['key'];
  }
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    return map;
  }

}