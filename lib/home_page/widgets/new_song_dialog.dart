import 'package:flutter/material.dart';

import 'dropdown_button_form_field.dart';

Future<void> newSongDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const NewSongDialog();
      });
}

class NewSongDialog extends StatelessWidget {
  const NewSongDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesList = <String>[];
    /*for (var cat in myRepertory.categories) {
      categoriesList.add(cat.name);
      for (var sub in cat.subcats) {
        categoriesList.add(sub);
      }
    }*/
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: const Text('Adicionar música'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            AppDropdownButtonFormField(categories: categoriesList),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Link para letra',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Link para cifra',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            //TODO: submit
          },
          child: const Text('OK'),
        )
      ],
    );
  }
}
