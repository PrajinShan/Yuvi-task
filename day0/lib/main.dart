import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Stack(children: [Center(child: Text('Day-0 Setup Complete'),
        ),
        SafeArea(child: Align(
          alignment: Alignment.topLeft,
          child: Padding(padding: EdgeInsets.all(16.0),
          child: Text('PRAJIN S'),)
        ))
        ],)
      ),
    );
  }
}