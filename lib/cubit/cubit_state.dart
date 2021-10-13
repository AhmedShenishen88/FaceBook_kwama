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


