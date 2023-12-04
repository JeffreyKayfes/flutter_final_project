import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Basketball Stat Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AverageCard(),
          GameCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Make the container take up the full width
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Game #',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'Points: 0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'Rebounds: 0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'Assists: 0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'Steals: 0',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Blocks: 0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'FG%: 0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  '3P%: 0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'FT%: 0',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AverageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Make the container take up the full width
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Averages',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'Points: 0.0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'Rebounds: 0.0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'Assists: 0.0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'Steals: 0.0',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Blocks: 0.0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'FG%: 0.0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  '3P%: 0.0',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'FT%: 0.0',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
