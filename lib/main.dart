import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/main/main_screen.dart';
import 'package:movies_app/presentation/screens/main/providers/movies_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MoviesProvider())],
      child: MaterialApp(
        theme: MateTheme(),
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }

  ThemeData MateTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: Colors.pinkAccent);
}
