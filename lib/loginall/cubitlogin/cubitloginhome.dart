import 'package:bloc/bloc.dart';
import 'package:facebook/loginall/cubitlogin/cubitloginstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(InitializeLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void loginMethod({
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(ChangeScreenLoginSuccessState());
    }).catchError((error) {
      emit(ChangeScreenLoginErrorState());
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changeVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibilityScreenLoginState());
  }
}
