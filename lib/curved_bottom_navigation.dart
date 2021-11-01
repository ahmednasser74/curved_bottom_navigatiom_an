import 'package:bottom_navigation/enums.dart';
import 'package:flutter/material.dart';
import 'painter_bottom_navigation.dart';

// ignore: must_be_immutable
class CurvedBottomNavigationAN extends StatefulWidget {
  final List<Widget> screenItems, buttonItems;
  final void Function(int index) currentIndex;
  final double buttonRadius, buttonWidth, buttonHeight, elevation, heightFactor;
  int initIndex;
  final BottomNavStyle bottomNavStyle;
  final Color selectedColor,
      unSelectedColor,
      curvedButtonUnSelectedColor,
      curvedButtonSelectedColor,
      backgroundColor;

  CurvedBottomNavigationAN({
    Key? key,
    required this.screenItems,
    required this.currentIndex,
    required this.buttonItems,
    this.initIndex = 0,
    this.buttonRadius = 10,
    this.buttonWidth = 50,
    this.buttonHeight = 50,
    this.elevation = 0,
    this.heightFactor = .7,
    this.selectedColor = Colors.red,
    this.unSelectedColor = Colors.black26,
    this.backgroundColor = Colors.white,
    this.curvedButtonUnSelectedColor = Colors.white,
    this.curvedButtonSelectedColor = Colors.red,
    this.bottomNavStyle = BottomNavStyle.curvedBottomNavCenter,
  }) : super(key: key);

  @override
  State<CurvedBottomNavigationAN> createState() =>
      _CurvedBottomNavigationANState();
}

class _CurvedBottomNavigationANState extends State<CurvedBottomNavigationAN> {
  late int currentIndex;

  Widget selectedScreen(int currentIndex) {
    final screen = Scaffold(body: widget.screenItems.elementAt(currentIndex));
    return screen;
  }

  void changeIndex(int index) {
    widget.initIndex = index;
    currentIndex = index;
    widget.currentIndex(widget.initIndex);
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    currentIndex = widget.initIndex;
    exceptionHandler(
      screenItems: widget.screenItems,
      buttonItems: widget.buttonItems,
    );
  }

  @override
  void didUpdateWidget(covariant CurvedBottomNavigationAN oldWidget) {
    super.didUpdateWidget(oldWidget);
    exceptionHandler(
      screenItems: widget.screenItems,
      buttonItems: widget.buttonItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    final lengthIsFive = widget.screenItems.length == 5 ? true : false;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          selectedScreen(currentIndex),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * .10,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 120),
                    painter: CurvedBottomNavCustomPainter(
                      color: widget.backgroundColor,
                      elevation: widget.elevation,
                      bottomNavStyle: widget.bottomNavStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: widget.heightFactor,
                      child: FloatingActionButton(
                        backgroundColor: curvedButtonColor(),
                        onPressed: () => changeIndex(lengthIsFive ? 2 : 1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: widget.buttonItems
                                .elementAt(lengthIsFive ? 2 : 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (widget.bottomNavStyle ==
                                BottomNavStyle.curvedBottomNavCenter ||
                            widget.bottomNavStyle ==
                                BottomNavStyle.curvedBottomNavCenterCurve)
                          _buttonOfBottomNavigation(
                            onTap: () => changeIndex(0),
                            icon: widget.buttonItems.elementAt(0),
                            color: changeColorOfSelectedIndex(0),
                          ),
                        Visibility(
                          visible: lengthIsFive,
                          child: _buttonOfBottomNavigation(
                            onTap: () => changeIndex(lengthIsFive ? 1 : 0),
                            icon: widget.buttonItems
                                .elementAt(lengthIsFive ? 1 : 0),
                            color: changeColorOfSelectedIndex(
                                lengthIsFive ? 1 : 0),
                          ),
                        ),
                        SizedBox(width: size.width * .20),
                        Visibility(
                          visible: lengthIsFive,
                          child: _buttonOfBottomNavigation(
                            onTap: () => changeIndex(lengthIsFive ? 3 : 0),
                            icon: widget.buttonItems
                                .elementAt(lengthIsFive ? 3 : 0),
                            color: changeColorOfSelectedIndex(
                              lengthIsFive ? 3 : 0,
                            ),
                          ),
                        ),
                        _buttonOfBottomNavigation(
                          onTap: () => changeIndex(lengthIsFive ? 4 : 2),
                          icon: widget.buttonItems
                              .elementAt(lengthIsFive ? 4 : 2),
                          color:
                              changeColorOfSelectedIndex(lengthIsFive ? 4 : 2),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonOfBottomNavigation({
    required VoidCallback onTap,
    required Widget icon,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: widget.selectedColor,
      child: Container(
        height: widget.buttonHeight,
        width: widget.buttonWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(widget.buttonRadius),
        ),
        child: icon,
      ),
    );
  }

  Color curvedButtonColor() {
    final lengthIsFive = widget.screenItems.length == 5 ? true : false;
    if (lengthIsFive) {
      if (currentIndex == 2) {
        return widget.curvedButtonSelectedColor;
      } else {
        return widget.curvedButtonUnSelectedColor;
      }
    } else {
      if (currentIndex == 1) {
        return widget.curvedButtonUnSelectedColor;
      } else {
        return widget.curvedButtonUnSelectedColor;
      }
    }
  }
  Color changeColorOfSelectedIndex(int index) {
    if (currentIndex == index) {
      return widget.selectedColor;
    } else {
      return widget.unSelectedColor;
    }
  }

  void exceptionHandler({
    required List<Widget> screenItems,
    required List<Widget> buttonItems,
  }) {
    if (screenItems.length.isOdd && screenItems.length == 3 ||
        screenItems.length == 5) {
    } else if (screenItems.length != buttonItems.length) {
      throw Exception('screenList.length must equal buttonWidgetList.length');
    } else if (screenItems.length != 3 || screenItems.length != 5) {
      throw Exception('screenList.length must equal 3 or 5');
    } else if (buttonItems.length != 3 || buttonItems.length != 5) {
      throw Exception('buttonWidgetList.length must 3 or equal 5');
    } else {
      throw Exception('screenList.length must be 3 or 5 ');
    }
  }
}
