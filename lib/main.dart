import 'package:flutter/material.dart';
import 'curved_bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const ExampleDemo(),
    );
  }
}

class ExampleDemo extends StatefulWidget {
  const ExampleDemo({Key? key}) : super(key: key);

  @override
  State<ExampleDemo> createState() => _ExampleDemoState();
}

class _ExampleDemoState extends State<ExampleDemo> {
  int x = 0;
  int initIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedBottomNavigation(
        initIndex: initIndex,
        color: Colors.white,
        elevation: 4,
        buttonBorderRadius: 30,
        selectedColor: const Color(0xfff63939),
        unSelectedColor: const Color(0xfffa9d9d),
        curvedButtonSelectedColor: const Color(0xff6969fa),
        curvedButtonUnSelectedColor: const Color(0xffaaa8a8),
        // ignore: avoid_print
        currentIndex: (index) => setState(() => initIndex = index),
        screenList: const [
          ExampleScreenOne(title: 'Home', color: Colors.red),
          ExampleScreenOne(title: 'Map', color: Colors.orange),
          ExampleScreenOne(title: 'Notification', color: Colors.yellow),
          ExampleScreenOne(title: 'Store', color: Colors.green),
          ExampleScreenOne(title: 'Profile', color: Colors.cyanAccent),
        ],
        buttonWidgetList: const [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.my_location, color: Colors.black),
          Icon(Icons.notifications_active, color: Colors.black),
          Icon(Icons.shop, color: Colors.black),
          Icon(Icons.person, color: Colors.black),
        ],
      ),
    );
  }
}

class ExampleScreenOne extends StatefulWidget {
  final String title;
  final Color color;

  const ExampleScreenOne({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  State<ExampleScreenOne> createState() => _ExampleScreenOneState();
}

class _ExampleScreenOneState extends State<ExampleScreenOne> {
  int counter = 0;

  void increment() {
    counter++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: widget.color,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.title + ' Screen', style: const TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
