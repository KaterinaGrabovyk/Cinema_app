import 'package:flutter/material.dart';
import 'package:cinema/choose_movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Кінотеатр',
      home: ChooseMovieScreen(),
    );
  }
}
