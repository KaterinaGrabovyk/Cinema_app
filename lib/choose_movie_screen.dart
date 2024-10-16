import 'package:flutter/material.dart';
import 'package:cinema/data/movies.dart';
import 'choose_movie_seanses.dart';

class ChooseMovieScreen extends StatelessWidget {
  const ChooseMovieScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const list = movies;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Вибір фільму', style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 105, 79, 0),
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...list.map(
            (movie) {
              return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 85, 12, 145)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseMovieSeanses(
                                      seanses: movie.seanses,
                                      film: movie.name,
                                    )));
                      },
                      child: Text(
                        movie.name,
                        style: const TextStyle(fontSize: 20),
                      )));
            },
          )
        ],
      ),
    );
  }
}
