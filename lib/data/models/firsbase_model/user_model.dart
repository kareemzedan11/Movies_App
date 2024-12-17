
class UserModel {
  String? userid;
  String? email;
  String? firstName;
  String? lastName;
  String? imageUrl;
  UserModel(
      {required this.email,
      required this.userid,
      required this.firstName,
      required this.lastName,
      this.imageUrl});
  UserModel.fromFireStore(Map<String, dynamic> data) {
    userid = data["userid"];
    email = data["email"];
    firstName = data["firstName"];
    lastName = data["lastName"];
    imageUrl = data["image_Bath"];
  }
  Map<String, dynamic> toFirestore() {
    return {
      "userid": userid,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "image_Bath": imageUrl,
    };
  }
}
