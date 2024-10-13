import 'package:flutter/material.dart';
import 'package:cinema/data/movies.dart';
import 'choose_movie_seanses.dart';

class ChooseMovieScreen extends StatefulWidget {
  const ChooseMovieScreen({super.key});
  @override
  State<ChooseMovieScreen> createState() {
    return _ChooseMovieScreenState();
  }
}

class _ChooseMovieScreenState extends State<ChooseMovieScreen> {
  @override
  Widget build(BuildContext context) {
    const list = movies;
    return Scaffold(
      appBar: AppBar(title: const Text('Вибір фільму')),
      body: Column(
        children: [
          ...list.map(
            (movie) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseMovieSeanses(
                                        seanses: movie.seanses,
                                      )));
                        },
                        child: Text(movie.name))
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
