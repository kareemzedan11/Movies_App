import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/PopularEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/movies/popular_usecase.dart';

@injectable
class PopularHomeTabViewModel extends Cubit<PopularHomeTabStates> {
  PopularHomeTabViewModel(this.popularUseCase)
      : super(PopularHomeTabInitialState());
  @factoryMethod
  PoplularUseCase popularUseCase;
  static List<PopularEntitie> popularList = [];
  getPopularDirectly() {
    emit(PopularHomeTabSuccessState(popularList));
  }

  getPopular({required int page}) async {
    emit(PopularHomeTabLoadingState());
    var result = await popularUseCase.call(page: page);
    result.fold((categories) {
      if (page == 1) {
        popularList.clear();
      }
      popularList.addAll(categories);
      emit(PopularHomeTabSuccessState(categories));
    }, (error) {
      emit(PopularHomeTabErrorState(error));
    });
  }
}

abstract class PopularHomeTabStates {}

class PopularHomeTabInitialState extends PopularHomeTabStates {}

class PopularHomeTabLoadingState extends PopularHomeTabStates {}

class PopularHomeTabSuccessState extends PopularHomeTabStates {
  List<PopularEntitie> categories;
  PopularHomeTabSuccessState(this.categories);
}

class PopularHomeTabErrorState extends PopularHomeTabStates {
  String error;
  PopularHomeTabErrorState(this.error);
}
