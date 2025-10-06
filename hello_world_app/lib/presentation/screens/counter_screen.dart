import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  //final int clickcounter = 10;
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickcounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //'$clickName!!',
              'Click${clickcounter == 1 ? '' : 's'}',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              ' $clickcounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón
          setState(() {
            clickcounter++;
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    ); // Scaffold
  }
}
