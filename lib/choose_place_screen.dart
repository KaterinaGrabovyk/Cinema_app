import 'package:cinema/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:cinema/cinema_screen.dart';

class SeatingChart extends StatefulWidget {
  const SeatingChart(
      {super.key, required this.film, required this.day, required this.time});
  final String film;
  final String day;
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
      String seatInfo = "Квиток на ${row + 1} Ряд; ${seat + 1} Місце; 150 грн;";

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
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Вибір місць', style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 105, 79, 0),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(choosenSeats.isNotEmpty ? "КВИТКИ" : "",
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold)),
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 204, 163, 40)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ...choosenSeats.map((choosen) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 33, 40, 145),
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: Row(
                                children: [
                                  Text(
                                    choosen,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            color: Colors.white,
            child: Column(
              children: [
                CustomPaint(
                  size: const Size(350, 30),
                  painter: HalfCirclePainter(),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: InteractiveViewer(
                    boundaryMargin: const EdgeInsets.only(
                      top: 2,
                      bottom: 2,
                    ),
                    maxScale: 3.0,
                    minScale: 1.0,
                    child: SizedBox(
                      height: 120,
                      width: 370,
                      child: Column(
                        children: [
                          for (int row = 0; row < rows; row++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 3, left: 10),
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
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 85, 12, 145)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderScreen(
                              film: widget.film,
                              day: widget.day,
                              time: widget.time,
                              choosenSeats: choosenSeats,
                            )));
              },
              child: const Text(
                "Оформити замовлення",
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }
}
