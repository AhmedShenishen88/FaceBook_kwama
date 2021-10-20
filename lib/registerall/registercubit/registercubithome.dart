import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      userCreate(uId: value.user!.uid, email: email, name: name, phone: phone);
      print(value.user!.email);
      print(value.user!.uid);
      emit(ChangeScreenRegisterSuccessState());
    }).catchError((error) {
      emit(ChangeScreenRegisterErrorState());
    });
  }

  CreateProfile? model;
  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
  }) {
    model = CreateProfile(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      isEmailVerified: false,
      bio: 'Write Your Bio....',
      image:
          'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-1/p240x240/244726719_4389031117886388_616164943763178058_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_eui2=AeGYHDGZE0lMUSkmtHeHzFZqzNcd3PxKVrDM1x3c_EpWsIDLJ_ihkq0dp-2ptdONbAhGgt99c-jxm9diGSOxWOTu&_nc_ohc=HSKSTsz2CvYAX97QLjS&_nc_ht=scontent.faly1-2.fna&oh=e2c9ffd303395d35bc6f9c3282c6ca90&oe=618936E7',
      cover:
          'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/59157504_2203489946440527_65945782561275904_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeGqldzKddQfObuMNv0AFNCAKZ5BFMYy8QEpnkEUxjLxAcJ_WHD9f-kfUs2KqkTWJqp-stpAnkIMIgEub_rvdfE4&_nc_ohc=egCiFMbpGFMAX8_rVhy&_nc_ht=scontent.faly1-2.fna&oh=2520ee6930b0c08f96703c435af77a0c&oe=618C124C',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model!.toMap())
        .then((value) {
      emit(UserCreateRegisterSuccessState());
    }).catchError((error) {
      emit(UserCreateRegisterErrorState());
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
