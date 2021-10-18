abstract class CubitStateFace {}

class InitializeCubitState extends CubitStateFace {}

class ChangeCubitStateNav extends CubitStateFace {}

class LoadingGetDataStateHome extends CubitStateFace {}

class SuccessGetDataStateHome extends CubitStateFace {}

class ErrorGetDataStateHome extends CubitStateFace {
  final error;
  ErrorGetDataStateHome(this.error);
}

class ChooseImagePickerScreenSuccess extends CubitStateFace {}

class ChooseImagePickerScreenError extends CubitStateFace {}

class UploadingImagePickerScreenSuccess extends CubitStateFace {}

class UploadingImagePickerScreenError extends CubitStateFace {}

class UploadingCoverPickerScreenSuccess extends CubitStateFace {}

class UploadingCoverPickerScreenError extends CubitStateFace {}
