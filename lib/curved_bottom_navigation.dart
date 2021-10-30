import 'package:flutter/material.dart';

import 'painter_bottom_navigation.dart';

// ignore: must_be_immutable
class CurvedBottomNavigationAN extends StatefulWidget {
  final List<Widget> screenItems, buttonItems;
  final Color selectedColor,
      unSelectedColor,
      curvedButtonUnSelectedColor,
      curvedButtonSelectedColor,
      backgroundColor;
  final void Function(int index) currentIndex;
  final double buttonRadius, buttonWidth, buttonHeight, elevation, heightFactor;
  int initIndex;

  CurvedBottomNavigationAN({
    Key? key,
    required this.screenItems,
    required this.currentIndex,
    required this.buttonItems,
    this.selectedColor = Colors.red,
    this.unSelectedColor = Colors.black26,
    this.backgroundColor = Colors.white,
    this.initIndex = 0,
    this.curvedButtonUnSelectedColor = Colors.white,
    this.curvedButtonSelectedColor = Colors.red,
    this.buttonRadius = 10,
    this.buttonWidth = 50,
    this.buttonHeight = 50,
    this.elevation = 0,
    this.heightFactor = .7,
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

  Color changeColorOfSelectedIndex(int index) {
    if (currentIndex == index) {
      return widget.selectedColor;
    } else {
      return widget.unSelectedColor;
    }
  }

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initIndex;
    if (widget.screenItems.length.isOdd && widget.screenItems.length == 3 ||
        widget.screenItems.length == 5) {
    } else if (widget.screenItems.length != widget.buttonItems.length) {
      throw Exception('screenList.length must equal buttonWidgetList.length');
    } else if (widget.screenItems.length != 3 ||
        widget.screenItems.length != 5) {
      throw Exception('screenList.length must equal 3 or 5');
    } else if (widget.buttonItems.length != 3 ||
        widget.buttonItems.length != 5) {
      throw Exception('buttonWidgetList.length must 3 or equal 5');
    } else {
      throw Exception('screenList.length must be 3 or 5 ');
    }
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
                    painter: PainterCenterBottomNavigation(
                      color: widget.backgroundColor,
                      elevation: widget.elevation,
                    ),
                  ),
                  Center(
                    heightFactor: widget.heightFactor,
                    child: FloatingActionButton(
                      backgroundColor: lengthIsFive
                          ? currentIndex == 2
                              ? widget.curvedButtonSelectedColor
                              : widget.curvedButtonUnSelectedColor
                          : currentIndex == 1
                              ? widget.curvedButtonSelectedColor
                              : widget.curvedButtonUnSelectedColor,
                      // onPressed: () => changeIndex(lengthIsFive ? 2 : 1),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.black12,
                          child: Container(
                            height: size.height * .60,
                            width: size.width,
                            alignment: Alignment.center,
                            color: Colors.green,
                            child: const Text('hey'),
                          ),
                        ),
                      ),
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
                  SizedBox(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buttonOfBottomNavigation(
                          onTap: () => changeIndex(0),
                          icon: widget.buttonItems.elementAt(0),
                          color: changeColorOfSelectedIndex(0),
                        ),
                        Visibility(
                          visible: lengthIsFive,
                          child: buttonOfBottomNavigation(
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
                          child: buttonOfBottomNavigation(
                            onTap: () => changeIndex(lengthIsFive ? 3 : 0),
                            icon: widget.buttonItems
                                .elementAt(lengthIsFive ? 3 : 0),
                            color: changeColorOfSelectedIndex(
                                lengthIsFive ? 3 : 0),
                          ),
                        ),
                        buttonOfBottomNavigation(
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

  Widget buttonOfBottomNavigation({
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
}

///if use custom bottom navigation
//    return Scaffold(
//       body: Stack(
//         children: [
//           selectedScreen(widget.initIndex),
//           CustomBottomNavigation(
//             changeIndex: widget.currentIndex,
//             screenList: widget.screenList,
//             buttonWidgetList: widget.buttonWidgetList,
//             buttonWidth: widget.buttonWidth,
//             buttonHeight: widget.buttonHeight,
//             curvedButtonSelectedColor: widget.curvedButtonSelectedColor,
//             color: widget.color,
//             elevation: widget.elevation,
//             selectedColor: widget.selectedColor,
//             initIndex: widget.initIndex,
//             curvedButtonUnSelectedColor: widget.curvedButtonUnSelectedColor,
//             buttonBorderRadius: widget.buttonBorderRadius,
//             unSelectedColor: widget.unSelectedColor,
//             key: widget.key,
//           ),
//         ],
//       ),
//     );
