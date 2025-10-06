import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter_functions_screen.dart';
//import 'package:hello_world_app/presentation/screens/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World App',

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        //primarySwatch: Colors.indigo
      ),
      //home: CounterScreen(),
      home: CounterFunctionsScreen(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
