import 'package:cinema/choose_place_screen.dart';
import 'package:flutter/material.dart';

class ChooseMovieSeanses extends StatefulWidget {
  const ChooseMovieSeanses({
    super.key,
    required this.film,
    required this.seanses,
  });
  final String film;
  final List<List<String>> seanses;

  @override
  State<ChooseMovieSeanses> createState() {
    return _ChooseMovieSeansesState();
  }
}

class _ChooseMovieSeansesState extends State<ChooseMovieSeanses> {
  String selectedDate = "day1";
  List<String> dates = ["day1", "day2", "day3", "day4", "day5", "day6", "day7"];
  List<String> actual = [];

  @override
  void initState() {
    super.initState();
    actual = widget.seanses[0];
  }

  @override
  Widget build(BuildContext context) {
    void daySeanse() {
      setState(() {
        if (selectedDate == "day6" || selectedDate == "day7") {
          actual = widget.seanses[1];
        } else {
          actual = widget.seanses[0];
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Вибір сеансу', style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 105, 79, 0),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...actual.map((seanse) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 85, 12, 145)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeatingChart(
                                film: widget.film,
                                day: selectedDate,
                                time: seanse)));
                  },
                  child: Text(
                    seanse,
                    style: const TextStyle(fontSize: 30),
                  )),
            );
          }),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = dates[index];
                      daySeanse();
                    });
                  },
                  child: Container(
                    width: 50,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: selectedDate == dates[index]
                          ? const Color.fromARGB(255, 56, 30, 161)
                          : const Color.fromARGB(255, 30, 17, 84),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      dates[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: selectedDate == dates[index]
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectedDate == dates[index]
                            ? const Color.fromARGB(255, 255, 255,
                                255) // Text color for selected item
                            : const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
