import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/shared/arabic_datasource.dart';
import 'package:movies_app/domain/entities/movies/FilterEntitie.dart';

@injectable
class ArabicMovieViewModel extends Cubit<ArabicMovieViewModelStates> {
  ArabicMovieViewModel(this.arabicDatasource)
      : super(ArabicMovieViewModelInitialState());
  @factoryMethod
  ArabicDatasource arabicDatasource;
  static List<FilterEntitie> arabicMovies = [];
  getArabicMoviesDirectly() {
    emit(ArabicMovieViewModelSuccessState(arabicMovies));
  }
  getArabicMovies({
    required int page,
  }) async {
    emit(ArabicMovieViewModelLoadingState());
    var result =
        await arabicDatasource.getArabic(mediaType: "movie", page: page);
    result.fold((categories) {
      if (page == 1) {
        arabicMovies.clear();
      }
      List<FilterEntitie> list = categories.results
              ?.map(
                (e) => e.toFilterEntite(),
              )
              .toList() ??
          [];
      arabicMovies.addAll(list);
      emit(ArabicMovieViewModelSuccessState(list));
    }, (error) {
      emit(ArabicMovieViewModelErrorState(error));
    });
  }
}

abstract class ArabicMovieViewModelStates {}

class ArabicMovieViewModelInitialState extends ArabicMovieViewModelStates {}

class ArabicMovieViewModelLoadingState extends ArabicMovieViewModelStates {}

class ArabicMovieViewModelSuccessState extends ArabicMovieViewModelStates {
  List<FilterEntitie> categories;
  ArabicMovieViewModelSuccessState(this.categories);
}

class ArabicMovieViewModelErrorState extends ArabicMovieViewModelStates {
  String error;
  ArabicMovieViewModelErrorState(this.error);
}
