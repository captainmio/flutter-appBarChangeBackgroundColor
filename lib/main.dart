import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
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
  final List colors = [
    {
      'label': 'Red',
      'color': Colors.red,
    },
    {
      'label': 'Green',
      'color': Colors.green,
    },
    {
      'label': 'Blue',
      'color': Colors.blue,
    }
  ];

  Color primaryColor = Colors.blue;

  changeAppBarBackgroundColor(color) {
    setState(() {
      primaryColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar change background color'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: colors.map<Widget>((item) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    changeAppBarBackgroundColor(item['color']);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: item['color'],
                      minimumSize: const Size.fromHeight(50)),
                  child: Text(
                    item['label'],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
