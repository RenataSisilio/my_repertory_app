import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_repository.dart';
import 'app_states.dart';

class AppController extends Cubit<AppState> {
  final AppRepository repository;

  AppController(
    this.repository,
  ) : super(LoadingAppState());

  void getCategories() async {
    emit(LoadingAppState());
    try {
      emit(SuccessAppState(await repository.getAllCategories()));
    } catch (e) {
      emit(ErrorAppState());
    }
  }
}
