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
//TODO: make curved button applicable for bottom sheet and dialogs not only
//  as screen and make curved button customize from user

class ExampleDemo extends StatefulWidget {
  const ExampleDemo({Key? key}) : super(key: key);

  @override
  State<ExampleDemo> createState() => _ExampleDemoState();
}

class _ExampleDemoState extends State<ExampleDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedBottomNavigationAN(
        initIndex: 2,
        backgroundColor: Colors.white,
        elevation: 4,
        buttonRadius: 20,
        selectedColor: const Color(0xfff63939),
        unSelectedColor: const Color(0xffffffff),
        // curvedButtonSelectedColor: const Color(0xff69ddfa),
        curvedButtonUnSelectedColor: const Color(0xffaaa8a8),
        currentIndex: (index) {},
        screenItems: const [
          ScreenExample(title: 'Home', color: Colors.red),
          ScreenExample(title: 'Map', color: Colors.orange),
          ScreenExample(title: 'Notification', color: Colors.yellow),
          ScreenExample(title: 'Store', color: Colors.green),
          ScreenExample(title: 'Profile', color: Colors.cyanAccent),
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

class ScreenExample extends StatelessWidget {
  final String title;
  final Color color;

  const ScreenExample({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: color,
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: Text(title + ' Screen', style: const TextStyle(fontSize: 30)),
    );
  }
}
