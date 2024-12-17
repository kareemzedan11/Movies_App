import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart'
    as auth;
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/data/data_source_contract/local/login_data_source.dart';
import 'package:movies_app/data/models/firsbase_model/user_model.dart';
import 'package:movies_app/domain/use_cases/Local/login_usecase.dart';
import 'package:provider/provider.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  @factoryMethod
  LoginViewModel(this.loginUsecase, this.loginDataSource)
      : super(LoginInitState());

  LoginUsecase loginUsecase;
  LoginDataSource loginDataSource;
  static LoginViewModel get(BuildContext context) => BlocProvider.of(context);
  login(String email, String password, BuildContext context) async {
    emit(LoginLoadingState());
    var credential = await loginUsecase.call(email, password);
    credential.fold(
      (error) => emit(LoginErrorState(error)),
      (usercredential) async {
        auth.AuthProvider provider =
            Provider.of<auth.AuthProvider>(context, listen: false);
        try {
          UserModel? user =
              await FireStoreHelper.getUser(userId: usercredential.user!.uid);
          provider.setUsers(usercredential.user, user);
          emit(LoginSuccessState(usercredential));
        } catch (e) {
          emit(LoginErrorState(e.toString()));
        }
      },
    );
  }

  loginWithGoogle({required BuildContext context}) async {
    emit(LoginLoadingState());
    var credential = await loginDataSource.loginWithGoogle();
    credential.fold(
      (error) {
        log(error);
        emit(LoginErrorState(error));
      },
      (usercredential) async {
        auth.AuthProvider provider =
            Provider.of<auth.AuthProvider>(context, listen: false);
        try {
          UserModel? user =
              await FireStoreHelper.getUser(userId: usercredential.user!.uid);
          provider.setUsers(usercredential.user, user);
          emit(LoginSuccessState(usercredential));
        } catch (e) {
          log(e.toString());
          emit(LoginErrorState(e.toString()));
        }
      },
    );
  }
}

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  String errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginSuccessState extends LoginState {
  UserCredential usercredential;
  LoginSuccessState(this.usercredential);
}
