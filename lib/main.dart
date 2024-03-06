import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/next_page.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  void initState() {
    super.initState();
    // fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://8241e79b-0f84-447b-a817-4f2782c17227.mock.pstmn.io/fruits'));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('A network error occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyWidget()),
                  // );

                  try {
                    final response = await http.get(Uri.parse('https://8241e79b-0f84-447b-a817-4f2782c17227.mock.pstmn.io/fruits'));

                    if (response.statusCode == 200) {
                      print(response.body);
                    } else {
                      print('A network error occurred');
                    }
                  } catch (error) {
                    print('An error occurred: $error');
                  }
                },
                child: Text('Move to next page')),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
