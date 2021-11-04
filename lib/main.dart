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
      elevation: 4,
      buttonRadius: 20,
      heightFactor: .6,
      backgroundColor: const Color(0xffffffff),
      selectedColor: const Color(0xffffcdd3),
      unSelectedColor: const Color(0xffffffff),
      curvedButtonSelectedColor: const Color(0xff69ddfa),
      curvedButtonUnSelectedColor: const Color(0xffaaa8a8),
      bottomNavStyle: BottomNavStyle.center,
      currentIndex: (index) {},
      screenItems: const [
        ScreenExample(title: 'Home', color: Colors.red),
        ScreenExample(title: 'Map', color: Colors.orange),
        ScreenExample(title: 'Notification', color: Colors.yellow),
        ScreenExample(title: 'Cart', color: Colors.green),
        ScreenExample(title: 'Profile', color: Colors.cyanAccent),
      ],
      buttonItems: const [
        Icon(Icons.home,size: 30),
        Icon(Icons.my_location,size: 30),
        Icon(Icons.notifications_active,size: 30),
        Icon(Icons.shopping_cart,size: 30),
        Icon(Icons.person,size: 30),
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
