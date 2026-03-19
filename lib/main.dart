import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Application root widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // Zadanie 1
          title: Text("Krakflow")
        ),
        // Zadanie 3
        body: Center(
          // Zadanie 2
          child: Column(
            children: [
              Text("Krakflow"),
              Text("Organizacja studiów"),
              Text("Dzisiejsze zadania")
            ]
          )
        )

      )
    );
  }
}
