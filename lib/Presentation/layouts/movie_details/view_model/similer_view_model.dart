import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/SimilerEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/movies/similer_usecase.dart';

@injectable
class SimilerHomeTabViewModel extends Cubit<SimilerHomeTabStates> {
  SimilerHomeTabViewModel(this.similerUseCase)
      : super(SimilerHomeTabInitialState());

  final SimilerUseCase similerUseCase;
  static List<SimilerEntitie> similerList = [];
  static bool hasMore = true;

  Future<void> getSimiler({required num movieId, required int page}) async {
    if (page == 1) {
      similerList.clear();
      hasMore = true;
      emit(SimilerHomeTabLoadingState());
    } else {
      emit(SimilerHomeTabLoadingMoreState());
    }

    var result = await similerUseCase.call(movieId: movieId, page: page);
    result.fold((similer) {
      log("the list has length: ${similer.length}");

      if (page == 1) {
        similerList.clear();
      }

      if (similer.isEmpty) {
        hasMore = false;
        emit(SimilerHomeTabErrorState("empty"));
      } else {
        similerList.addAll(similer);
      }

      emit(SimilerHomeTabSuccessState(List<SimilerEntitie>.from(similerList)));
    }, (error) {
      emit(SimilerHomeTabErrorState(error));
    });
  }
}

abstract class SimilerHomeTabStates {}

class SimilerHomeTabInitialState extends SimilerHomeTabStates {}

class SimilerHomeTabLoadingState extends SimilerHomeTabStates {}

class SimilerHomeTabLoadingMoreState extends SimilerHomeTabStates {}

class SimilerHomeTabSuccessState extends SimilerHomeTabStates {
  final List<SimilerEntitie> similer;
  SimilerHomeTabSuccessState(this.similer);
}

class SimilerHomeTabErrorState extends SimilerHomeTabStates {
  final String error;
  SimilerHomeTabErrorState(this.error);
}
