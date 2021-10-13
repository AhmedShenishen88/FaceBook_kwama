import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/cubit/cubit_state.dart';
import 'package:facebook/endpoint/endpoint.dart';
import 'package:facebook/loginall/loginmodel/loginmodel.dart';
import 'package:facebook/modules/group/groupscreen.dart';
import 'package:facebook/modules/homeface/homface.dart';
import 'package:facebook/modules/marketplace/marketplacescreen.dart';
import 'package:facebook/modules/notification/notificationscreen.dart';
import 'package:facebook/modules/setting/settingscreen.dart';
import 'package:facebook/modules/watch/watchscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CubitFaceHome extends Cubit<CubitStateFace> {
  CubitFaceHome() : super(InitializeCubitState());

  static CubitFaceHome get(context) => BlocProvider.of(context);

  CreateProfile? model;

  void getAllUser() {
    emit(LoadingGetDataStateHome());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      model = CreateProfile.fromJson(value.data());
      print(uId);
      emit(SuccessGetDataStateHome());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetDataStateHome(error.toString()));
    });
  }

  List<Widget> screens = [
    HomeFaceScreen(),
    GroupScreen(),
    WatchScreen(),
    MarketPlacecreen(),
    NotificationScreen(),
    MenuScreen(),
  ];

  int currentIndex = 0;
  void changeScreenNav(int index) {
    currentIndex = index;
    emit(ChangeCubitStateNav());
  }

  var picker = ImagePicker();

  File? profileImage;
  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      // source: ImageSource.camera,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(ChooseImagePickerScreenSuccess());
    } else {
      print('No image selected.');
      emit(ChooseImagePickerScreenError());
    }
  }

  void uploadingImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {}).catchError((error) {});
    }).catchError((error) {});
  }

  File? profileCover;
  Future<void> getProfileCover() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      // source: ImageSource.camera,
    );

    if (pickedFile != null) {
      profileCover = File(pickedFile.path);
      print(pickedFile.path);
      emit(ChooseImagePickerScreenSuccess());
    } else {
      print('No image selected.');
      emit(ChooseImagePickerScreenError());
    }
  }

  void uploadingCover() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Uri.file(profileCover!.path).pathSegments.last}')
        .putFile(profileCover!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {}).catchError((error) {});
    }).catchError((error) {});
  }
}
