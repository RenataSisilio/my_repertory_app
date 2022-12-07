import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_repertory/app_repository.dart';

import '../app_states.dart';
import 'home_content.dart';
import '../app_controller.dart';
import 'home_controller.dart';
import 'widgets/new_song_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final pageController = PageController();
  final _selectedCategory = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AppController>();
    controller.getCategories();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: BlocBuilder(
            bloc: context.read<AppController>(),
            builder: (context, state) {
              if (state is ErrorAppState) {
                return const Center(child: Text('Error'));
              }
              if (state is SuccessAppState) {
                final categories = state.allCategories;
                return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    var myExpansionTile = ExpansionTile(
                      title: Text(categories[index].name),
                      children: [
                        ListTile(
                          title: const Text('Todas'),
                          onTap: () {
                            _selectedCategory.value = categories[index].name;
                            pageController.jumpToPage(0);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                    for (var sub in categories[index].subcats) {
                      myExpansionTile.children.add(
                        ListTile(
                          title: Text(sub),
                          onTap: () {
                            _selectedCategory.value = sub;
                            pageController.jumpToPage(0);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    }
                    return myExpansionTile;
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
      body: PageView(
        controller: pageController,
        children: [
          BlocProvider(
            create: (context) => HomeController(AppDioRepository()),
            child: ValueListenableBuilder(
              valueListenable: _selectedCategory,
              builder: (context, value, _) {
                return HomeContent(category: value);
              },
            ),
          ),
          const Center(
            child: Text('Favoritos'),
          ),
          BlocProvider(
            create: (context) => HomeController(AppDioRepository()),
            child: ValueListenableBuilder(
              valueListenable: _selectedCategory,
              builder: (context, value, _) {
                return HomeContent(category: value);
              },
            ),
          ),
          const Center(
            child: Text('Minhas listas'),
          ),
          const Center(
            child: Text('Configurações'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newSongDialog;
        },
        tooltip: 'Nova música',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          pageController.jumpToPage(value);
          _selectedIndex = value;
        },
      ),
    );
  }
}
