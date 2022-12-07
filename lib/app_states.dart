import 'models/category.dart';

abstract class AppState {}

class SuccessAppState implements AppState {
  SuccessAppState(
    this.allCategories,
  );

  List<Category> allCategories;
}

class LoadingAppState implements AppState {}

class ErrorAppState implements AppState {}
