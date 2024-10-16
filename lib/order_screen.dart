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
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Замовлення', style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 105, 79, 0),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Фільм: $film',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            'Дата: $day ,Час: $time',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 300,
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
                          border: Border.all(color: Colors.black, width: 2)),
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
