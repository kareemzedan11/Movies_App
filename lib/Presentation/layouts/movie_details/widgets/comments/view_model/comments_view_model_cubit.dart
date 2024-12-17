import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/MovieReviewEntity.dart';
import 'package:movies_app/domain/use_cases/remote/movies/movie_review_usecase.dart';

@injectable
class CommentsViewModelCubit extends Cubit<CommentsViewModelState> {
  CommentsViewModelCubit(this.movieReviewUsecase)
      : super(CommentsViewModelInitial());
  @factoryMethod
  MovieReviewUsecase movieReviewUsecase;
  getMovieComments({required int movieId}) async {
    var response = await movieReviewUsecase.call(movieId: movieId);
    emit(CommentsViewModelLoading());
    response.fold((result) {
      if (result.isEmpty) {
        emit(CommentsViewModelError("No comments found"));
      } else {
        emit(CommentsViewModelSuccess(result));
      }
    }, (error) {
      emit(CommentsViewModelError(error));
    });
  }
}

abstract class CommentsViewModelState {}

final class CommentsViewModelInitial extends CommentsViewModelState {}

final class CommentsViewModelLoading extends CommentsViewModelState {}

final class CommentsViewModelSuccess extends CommentsViewModelState {
  List<MovieReviewEntity> commentsList;
  CommentsViewModelSuccess(this.commentsList);
}

final class CommentsViewModelError extends CommentsViewModelState {
  String error;
  CommentsViewModelError(this.error);
}
