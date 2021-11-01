import 'package:flutter/material.dart';
import 'curved_bottom_navigation.dart';
import 'enums.dart';

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
      home: const Example(),
    );
  }
}

//TODO: make curved button applicable for bottom sheet and dialogs not only as screen and make curved button customize from user
//TODO: documentation for package
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedBottomNavigationAN(
      initIndex: 0,
      backgroundColor: Colors.white,
      elevation: 4,
      buttonRadius: 20,
      heightFactor: .6,
      selectedColor: const Color(0xffffcdd3),
      // unSelectedColor: const Color(0xffffffff),
      unSelectedColor: Colors.transparent,
      // curvedButtonSelectedColor: const Color(0xff69ddfa),
      curvedButtonUnSelectedColor: const Color(0xffaaa8a8),
      bottomNavStyle: BottomNavStyle.styleCenter,
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
