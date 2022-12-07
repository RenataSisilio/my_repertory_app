import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_repertory/app_controller.dart';
import 'package:my_repertory/app_repository.dart';

import 'home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Repertory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.blueGrey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        canvasColor: Colors.black87,
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      themeMode: ThemeMode.light,
      home: BlocProvider(
        create: (context) => AppController(AppDioRepository()),
        child: const HomePage(title: 'Meu Repertório'),
      ),
    );
  }
}
