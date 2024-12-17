import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/FilterEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/movies/filter_usecase.dart';

@injectable
class CategoryFilterViewModel extends Cubit<CategoryFilterStates> {
  CategoryFilterViewModel(this.filterUseCase) : super(CategoryFilterInitialState());

  @factoryMethod
  final FilterUseCase filterUseCase;

  static List<FilterEntitie> filterList = [];
  int currentPage = 1;
  bool isLoadingMore = false;

  void getFilterDirectly() {
    emit(CategoryFilterSuccessState(filterList));
  }

  Future<void> getFilter({required int categoryId, required String mediaType, required int page}) async {
    if (page == 1) {
      filterList.clear();
      emit(CategoryFilterLoadingState());
    } else {
      isLoadingMore = true;
      emit(CategoryFilterLoadingMoreState());
    }

    var result = await filterUseCase.call(categoryId: categoryId, mediaType: mediaType, page: page);
    result.fold((filteredMovies) {
      if (page == 1) {
        filterList.clear();
      }
      filterList.addAll(filteredMovies);
      emit(CategoryFilterSuccessState(filterList));
      currentPage = page;
      isLoadingMore = false;
    }, (error) {
      emit(CategoryFilterErrorState(error));
      isLoadingMore = false;
    });
  }

  void loadMore({required int categoryId, required String mediaType}) {
    if (!isLoadingMore) {
      getFilter(categoryId: categoryId, mediaType: mediaType, page: currentPage + 1);
    }
  }
}

abstract class CategoryFilterStates {}

class CategoryFilterInitialState extends CategoryFilterStates {}

class CategoryFilterLoadingState extends CategoryFilterStates {}

class CategoryFilterLoadingMoreState extends CategoryFilterStates {}

class CategoryFilterSuccessState extends CategoryFilterStates {
  final List<FilterEntitie> filter;
  CategoryFilterSuccessState(this.filter);
}

class CategoryFilterErrorState extends CategoryFilterStates {
  final String error;
  CategoryFilterErrorState(this.error);
}
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:movies_app/domain/entities/movies/FilterEntitie.dart';
// import 'package:movies_app/domain/use_cases/remote/movies/filter_usecase.dart';

// @injectable
// class CategoryFilterViewModel extends Cubit<CategoryFilterStates> {
//   CategoryFilterViewModel(this.filterUseCase)
//       : super(CategoryFilterInitialState());

//   @factoryMethod
//   final FilterUseCase filterUseCase;

//   static List<FilterEntitie> filterList = [];
//   int currentPage = 1;
//   bool isLoadingMore = false;

//   Future<void> getFilter({
//     required int categoryId,
//     required String mediaType,
//     required int page,
//   }) async {
//     if (page == 1) {
//       filterList.clear();
//       emit(CategoryFilterLoadingState());
//     } else {
//       isLoadingMore = true;
//     }

//     var result = await filterUseCase.call(
//       categoryId: categoryId,
//       mediaType: mediaType,
//       page: page,
//     );

//     result.fold(
//       (filteredMovies) {
//         filterList.addAll(filteredMovies);
//         emit(CategoryFilterSuccessState(filterList));
//         currentPage = page;
//         isLoadingMore = false;
//       },
//       (error) {
//         emit(CategoryFilterErrorState(error));
//         isLoadingMore = false;
//       },
//     );
//   }

//   void loadMore({
//     required int categoryId,
//     required String mediaType,
//   }) {
//     if (!isLoadingMore) {
//       getFilter(
//         categoryId: categoryId,
//         mediaType: mediaType,
//         page: currentPage + 1,
//       );
//     }
//   }
// }

// abstract class CategoryFilterStates {}

// class CategoryFilterInitialState extends CategoryFilterStates {}

// class CategoryFilterLoadingState extends CategoryFilterStates {}

// class CategoryFilterSuccessState extends CategoryFilterStates {
//   final List<FilterEntitie> filter;
//   CategoryFilterSuccessState(this.filter);
// }

// class CategoryFilterErrorState extends CategoryFilterStates {
//   final String error;
//   CategoryFilterErrorState(this.error);
// }
