import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BookMarkWidgetSeries extends StatelessWidget {
  BookMarkWidgetSeries({
    super.key,
    required this.fireBaseMovieModel,
  });

  FireBaseMovieModel fireBaseMovieModel;
  late bool isChosen;
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return GestureDetector(
        onTap: () {
          isChosen
              ? FireStoreHelper.deleteMovie(
                  userId: authProvider.fireBaseUserAuth!.uid,
                  movieId: fireBaseMovieModel.id?.toInt() ?? 0)
              : FireStoreHelper.addMovie(
                  userid: authProvider.fireBaseUserAuth?.uid ?? "",
                  movie: fireBaseMovieModel,
                );
        },
        child: StreamBuilder(
          stream: FireStoreHelper.getIsCheck(
              userID: authProvider.fireBaseUserAuth!.uid,
              id: fireBaseMovieModel.id?.toInt() ?? 0),
          builder: (context, snapshot) {
            FireBaseMovieModel movie =
                snapshot.data ?? FireBaseMovieModel(isSelected: false);
            bool isSelected = movie.isSelected!;
            isChosen = movie.isSelected!;
            return SvgPicture.asset(
              "assets/Icons/bookmark.svg",
              colorFilter: ColorFilter.mode(
                  isSelected ? Colors.amber : Colors.white, BlendMode.srcIn),
              height: 25,
            );
          },
        ));
  }
}
