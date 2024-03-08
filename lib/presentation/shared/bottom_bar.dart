import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/favorites/favorites_screen.dart';
import 'package:movies_app/presentation/screens/settings/settings_screen.dart';

class Bttom extends StatelessWidget {
  const Bttom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoritesScreen()));
              },
              icon: const Icon(Icons.favorite_sharp)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
    );
  }
}
