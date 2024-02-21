import 'package:flutter/material.dart';

class FavoritesDialog extends StatelessWidget {
  const FavoritesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text('¿Eliminar de favoritos?'),
      content: const Text(
          'Si eliminas la pelicula, entonces ya no estará disponible en "Favoritos".'),
      elevation: 2,
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('Cancelar')),
        TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Eliminar')),
      ],
    );
  }
}
