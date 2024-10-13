import 'package:flutter/material.dart';
import 'package:cinema/data/movies.dart';
import 'choose_movie_seanses.dart';

class ChooseMovieScreen extends StatelessWidget {
  const ChooseMovieScreen({super.key});
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
                                        film: movie.name,
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
