abstract class HomeState {}

class SuccessHomeState implements HomeState {
  SuccessHomeState(
    this.currentCategory,
  );

  String currentCategory;
}

class LoadingHomeState implements HomeState {}

class ErrorHomeState implements HomeState {}
