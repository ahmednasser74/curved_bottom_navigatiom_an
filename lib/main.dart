import 'package:flutter/material.dart';
import 'curved_bottom_navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
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
      body: CurvedBottomNavigationAN(
        initIndex: initIndex,
        backgroundColor: Colors.white,
        elevation: 4,
        buttonRadius: 20,
        selectedColor: const Color(0xfff63939),
        // unSelectedColor: const Color(0xffffffff),
        // curvedButtonSelectedColor: const Color(0xff69ddfa),
        curvedButtonUnSelectedColor: const Color(0xffaaa8a8),
        currentIndex: (index) => setState(() => initIndex = index),
        screenItems: const [
          ExampleScreenOne(title: 'Home', color: Colors.red),
          ExampleScreenOne(title: 'Map', color: Colors.orange),
          ExampleScreenOne(title: 'Notification', color: Colors.yellow),
          ExampleScreenOne(title: 'Store', color: Colors.green),
          ExampleScreenOne(title: 'Profile', color: Colors.cyanAccent),
        ],
        buttonItems: const [
          Icon(Icons.home),
          Icon(Icons.my_location),
          Icon(Icons.notifications_active),
          Icon(Icons.shop),
          Icon(Icons.person),
        ],
      ),
    );
  }
}

class ExampleScreenOne extends StatelessWidget {
  final String title;
  final Color color;

  const ExampleScreenOne({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: color,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title + ' Screen', style: const TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
