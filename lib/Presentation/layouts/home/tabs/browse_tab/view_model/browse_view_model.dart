import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/categories/Genres.dart';

import '../../../../../../domain/use_cases/remote/movies/category_usecase.dart';

@injectable
class BrowseTabViewModel extends Cubit<BrowseTabStates> {
  BrowseTabViewModel(this.categoryUseCase) : super(BrowseTabInitialState());
  @factoryMethod
  CategoryUseCase categoryUseCase;
 static List<Genres> categories = [];
  getCategoryDirectly() {
    emit(BrowseTabSuccessState(categories));
  }

  getCategory({required String mediaType}) async {
    emit(BrowseTabLoadingState());
    var categories = await categoryUseCase.call(mediaType: mediaType);
    categories.fold((response) => emit(BrowseTabSuccessState(response)),
        (error) => emit(BrowseTabErrorState(error)));
  }
}

abstract class BrowseTabStates {}

class BrowseTabInitialState extends BrowseTabStates {}

class BrowseTabLoadingState extends BrowseTabStates {}

class BrowseTabSuccessState extends BrowseTabStates {
  List<Genres> categories;
  BrowseTabSuccessState(this.categories);
}

class BrowseTabErrorState extends BrowseTabStates {
  String error;
  BrowseTabErrorState(this.error);
}
