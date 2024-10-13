import 'package:cinema/choose_place_screen.dart';
import 'package:flutter/material.dart';

class ChooseMovieSeanses extends StatefulWidget {
  const ChooseMovieSeanses({
    super.key,
    required this.seanses,
  });
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
      appBar: AppBar(title: const Text('Вибір сеансу')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...actual.map((seanse) {
            return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeatingChart(time: seanse)));
                },
                child: Text(seanse));
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
                          ? const Color.fromARGB(255, 229, 251, 25)
                          : const Color.fromARGB(158, 158, 158, 158),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      dates[index],
                      style: TextStyle(
                        color: selectedDate == dates[index]
                            ? const Color.fromARGB(
                                255, 0, 0, 0) // Text color for selected item
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
