import 'package:bloc/bloc.dart';
import 'package:facebook/loginall/loginmodel/loginmodel.dart';
import 'package:facebook/registerall/registercubit/registercubiitstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit() : super(InitializeRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void registerMethod({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      CreateProfile(password: password, uId: value.user!.uid, email: email);
      emit(ChangeScreenRegisterSuccessState());
    }).catchError((error) {
      emit(ChangeScreenRegisterErrorState());
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changeVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibilityScreenRegisterState());
  }
}
