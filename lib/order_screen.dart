import 'package:flutter/material.dart';
import 'package:cinema/thanks_screen.dart';

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
    double hei = choosenSeats.length * 60;
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
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 204, 163, 40)),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: hei <= 300 ? hei : 300,
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
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 85, 12, 145),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 85, 12, 145), width: 2),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThanksScreen()));
                    },
                    child: const Text(
                      "Завершити",
                      style: TextStyle(fontSize: 20),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 85, 12, 145)),
                    onPressed: () {},
                    child: const Text(
                      "Доодати снеки",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
