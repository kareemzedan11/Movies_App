import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';
import 'package:movies_app/data/models/firsbase_model/user_model.dart';
import 'package:provider/provider.dart';

@singleton
class FireStoreHelper {
  static CollectionReference<UserModel> getUserCollections() {
    var refernce = FirebaseFirestore.instance.collection("User").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? data = snapshot.data();
        return UserModel.fromFireStore(data ?? {});
      },
      toFirestore: (UserModel user, options) {
        return user.toFirestore();
      },
    );
    return refernce;
  }

  static Future<void> addUser({
    required String userId,
    required String email,
    required String firstName,
    required String lastName,
     String? imageUrl,
  }) async {
    var document = getUserCollections().doc(userId);
    await document.set(UserModel(
        email: email,
        userid: userId,
        firstName: firstName,
        lastName: lastName,imageUrl: imageUrl));
  }
  static Future<UserModel?> getUser({required String userId}) async {
    var userDoc = getUserCollections().doc(userId);
    var snapShot = await userDoc.get();
    UserModel? user = snapShot.data();
    return user;
  }
  

  static CollectionReference<FireBaseMovieModel>? getMovieCollections(
      {required String userid}) {
    var refernce =
        getUserCollections().doc(userid).collection("MyMovies").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? data = snapshot.data();
        return FireBaseMovieModel.fromJson(data ?? {});
      },
      toFirestore: (FireBaseMovieModel movie, options) {
        return movie.toJson();
      },
    );
    return refernce;
  }

  static addMovie(
      {required String userid, required FireBaseMovieModel movie}) async {
    await getMovieCollections(userid: userid)!
        .doc(movie.id.toString())
        .set(movie);
  }

  static Stream<FireBaseMovieModel> getIsCheck(
      {required String userID, required int id}) async* {
    DocumentReference<FireBaseMovieModel> filter =
        getMovieCollections(userid: userID)!.doc(id.toString());

    Stream<FireBaseMovieModel> snapshot = filter
        .snapshots()
        .map((event) => event.data() ?? FireBaseMovieModel(isSelected: false));
    yield* snapshot;
  }

  Stream<List<FireBaseMovieModel>> listenMoviesAndSeries(
      {required String userid}) async* {
    Stream<QuerySnapshot<FireBaseMovieModel>> movie =
        getMovieCollections(userid: userid)!.snapshots();
    Stream<List<FireBaseMovieModel>> movieList =
        movie.map((event) => event.docs.map((e) => e.data()).toList());
    yield* movieList;
  }

  Stream<List<FireBaseMovieModel>> listenMoviesOrSeries(
      {required String userid, required String type}) async* {
    Stream<QuerySnapshot<FireBaseMovieModel>> movie =
        getMovieCollections(userid: userid)!
            .where("media_type", isEqualTo: type)
            .snapshots();
    Stream<List<FireBaseMovieModel>> movieList =
        movie.map((event) => event.docs.map((e) => e.data()).toList());
    yield* movieList;
  }

  static Future<void> deleteMovie(
      {required String userId, required int movieId}) async {
    await getMovieCollections(userid: userId)?.doc(movieId.toString()).delete();
  }
 
  static final Logger logger = Logger();
  static Future<String> uploadImageToStorage({
    required String folderName,
    required Uint8List file,
  }) async {
    try {
      logger.d('Starting image upload...');
      Reference ref = FirebaseStorage.instance.ref("profile").child(folderName);
      UploadTask uploadTask = ref.putData(file);

      logger.d('Waiting for upload task to complete...');
      TaskSnapshot snapshot = await uploadTask;
      logger.d('Upload task completed.');

      String downloadUrl = await snapshot.ref.getDownloadURL();
      logger.d('Download URL: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      logger.e('Error during image upload: $e');
      rethrow;
    }
  }

  static Future<void> editProfile(
      {required UserModel user,
      required Uint8List file,
      required BuildContext context}) async {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      String imageUrl =
          await uploadImageToStorage(file: file, folderName: user.userid ?? "");
      user.imageUrl = imageUrl;
      await getUserCollections()
          .doc(user.userid ?? "")
          .update({
            "image_Bath":user.imageUrl,
          });
      authProvider.changeUserData(user);
    } catch (e) {
      logger.e('Error during profile edit: $e');
    }
  }

  static Future<void> editProfileName(
      {required UserModel user, required BuildContext context}) async {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      await getUserCollections()
          .doc(user.userid ?? "")
          .update({
            "firstName":user.firstName,
            "lastName":user.lastName,
          });
      authProvider.changeUserData(UserModel(
          email: user.email,
          userid: user.userid,
          firstName: user.firstName,
          lastName: user.lastName,
          imageUrl: authProvider.dataBaseUser?.imageUrl ?? ""));
    } catch (e) {
      logger.e('Error during profile edit: $e');
    }
  }
}
