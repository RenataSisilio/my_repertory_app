import 'package:flutter/material.dart';

import '../app_repository.dart';
import 'home_content.dart';
import '../app_controller.dart';
import 'widgets/new_song_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = AppController(AppDioRepository());

  int _selectedIndex = 0;
  final pages = [
    const HomeContent(category: ''),
    const Center(
      child: Text('Favoritos'),
    ),
    const HomeContent(category: ''),
    const Center(
      child: Text('Minhas listas'),
    ),
    const Center(
      child: Text('Configurações'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: FutureBuilder(
          future: controller.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              final categories = snapshot.data!;
              return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  var myExpansionTile = ExpansionTile(
                    title: Text(categories[index].name),
                    children: [
                      ListTile(
                        title: const Text('Todas'),
                        onTap: () {
                          setState(() {
                            pages[0] =
                                HomeContent(category: categories[index].name);
                            _selectedIndex = 0;
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ],
                  );
                  for (var sub in categories[index].subcats) {
                    myExpansionTile.children.add(
                      ListTile(
                        title: Text(sub),
                        onTap: () {
                          setState(() {
                            pages[0] = HomeContent(category: sub);
                            _selectedIndex = 0;
                            Navigator.pop(context);
                          });
                        },
                      ),
                    );
                  }
                  return myExpansionTile;
                },
              );
            }
            if (!snapshot.hasData && !snapshot.hasError) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: Text('Error'));
          },
        ),
      ),
      body: pages[_selectedIndex],
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
          BottomNavigationBarItem(icon: SizedBox(width: 1), label: ''),
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
        onTap: (_changeContent),
      ),
    );
  }

  _changeContent(index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
