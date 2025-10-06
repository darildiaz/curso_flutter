import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  //final int clickcounter = 10;
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionsScreen> {
  int clickcounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Fuctions'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                clickcounter = 0;
              });
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (clickcounter > 0) clickcounter--;
              });
            },
            icon: const Icon(Icons.exposure_minus_1),
          ),
        ],

        leading: IconButton(
          onPressed: () {
            setState(() {
              clickcounter = 0;
            });
          },
          icon: const Icon(Icons.home),
        ),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_outlined,
            onPressed: () {
              setState(() {
                clickcounter = 0;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              setState(() {
                clickcounter++;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1,
            onPressed: () {
              setState(() {
                if (clickcounter > 0) clickcounter--;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 5,
      backgroundColor: Colors.yellow,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
