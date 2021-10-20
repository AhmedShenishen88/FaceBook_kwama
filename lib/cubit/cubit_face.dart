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

  void uploadingImage({
    required String bio,
    required String cover,
    required String name,
  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateChanges(image: value, bio: bio, cover: cover, name: name);
        emit(UploadingImagePickerScreenSuccess());
      }).catchError((error) {
        emit(UploadingImagePickerScreenError());
      });
    }).catchError((error) {
      emit(UploadingImagePickerScreenError());
    });
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

  void uploadingCover({
    required String image,
    required String bio,
    required String name,
  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileCover!.path).pathSegments.last}')
        .putFile(profileCover!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateChanges(image: image, bio: bio, cover: value, name: name);
        emit(UploadingCoverPickerScreenSuccess());
      }).catchError((error) {
        emit(UploadingCoverPickerScreenError());
      });
    }).catchError((error) {
      emit(UploadingCoverPickerScreenError());
    });
  }

  late CreateProfile modelUpdate;
  void updateChanges({
    String? image,
    String? cover,
    String? bio,
    String? name,
  }) {
    modelUpdate = CreateProfile(
      image: image ?? model!.image,
      uId: model!.uId,
      name: name,
      bio: bio,
      cover: cover ?? model!.cover,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uId)
        .update(modelUpdate.toMap())
        .then((value) {})
        .catchError((error) {});
  }
}
