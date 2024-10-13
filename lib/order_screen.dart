import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen(
      {super.key,
      required this.film,
      required this.day,
      required this.time,
      required this.choosenSeats});
  final String film;
  final String day;
  final String time;
  final List<String> choosenSeats;
  @override
  Widget build(BuildContext context) {
    int summ = choosenSeats.length * 150;
    return Scaffold(
      appBar: AppBar(title: const Text('Замовлення')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Фільм: $film',
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            'Дата: $day Час: $time',
            style: const TextStyle(fontSize: 30),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                height: 400,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(color: Colors.amber),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const Text("КВИТКИ",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        ...choosenSeats.map((choosen) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Row(
                              children: [
                                Text(
                                  choosen,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Text("До сплати: $summ грн",
              style: const TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 228, 42, 0),
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
