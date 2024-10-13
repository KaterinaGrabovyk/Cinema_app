import 'package:flutter/material.dart';
import 'package:cinema/cinema_screen.dart';

class SeatingChart extends StatefulWidget {
  const SeatingChart({super.key, required this.time});
  final String time;
  @override
  State<SeatingChart> createState() {
    return _SeatingChartState();
  }
}

class _SeatingChartState extends State<SeatingChart> {
  final int rows = 8;
  final int seatsPerRow = 30;
  List<List<bool>> _seats = [];
  List<String> choosenSeats = [];
  @override
  void initState() {
    super.initState();
    _seats =
        List.generate(rows, (_) => List.generate(seatsPerRow, (_) => false));
  }

  void _toggleSeat(int row, int seat) {
    setState(() {
      _seats[row][seat] = !_seats[row][seat];
      String seatInfo = "Квиток на ${row + 1} Ряд; ${seat + 1} місце";

      if (_seats[row][seat]) {
        choosenSeats.add(seatInfo);
      } else {
        choosenSeats.remove(seatInfo);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Вибір місць на ${widget.time}')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 400,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: const BoxDecoration(color: Colors.amber),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const Text("КВИТКИ",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    ...choosenSeats.map((choosen) {
                      return Row(
                        children: [
                          Text(
                            choosen,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      );
                    }),
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          CustomPaint(
            size: const Size(350, 30),
            painter: HalfCirclePainter(),
          ),
          const SizedBox(
            height: 20,
          ),
          InteractiveViewer(
            boundaryMargin:
                const EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
            maxScale: 3.0,
            minScale: 1.0,
            child: SizedBox(
              height: 120,
              width: 400,
              child: Column(
                children: [
                  for (int row = 0; row < rows; row++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 3, left: 10),
                          width: 20,
                          child: Text(
                            '${row + 1}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        for (int seat = 0; seat < seatsPerRow; seat++)
                          GestureDetector(
                            onTap: () => _toggleSeat(row, seat),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 2.0),
                              width: 7,
                              height: 7,
                              color: _seats[row][seat]
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
