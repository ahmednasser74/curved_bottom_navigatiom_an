import 'package:flutter/material.dart';

import 'painter_bottom_navigation.dart';

// ignore: must_be_immutable
class CurvedBottomNavigation extends StatefulWidget {
  final List<Widget> screenList, buttonWidgetList;
  final Color selectedColor,
      unSelectedColor,
      curvedButtonUnSelectedColor,
      curvedButtonSelectedColor,
      color;
  final void Function(int index) currentIndex;
  final double buttonBorderRadius, buttonWidth, buttonHeight, elevation;
  int initIndex;

  CurvedBottomNavigation({
    Key? key,
    required this.screenList,
    required this.currentIndex,
    required this.buttonWidgetList,
    this.selectedColor = Colors.red,
    this.unSelectedColor = Colors.black26,
    this.color = Colors.white,
    this.initIndex = 0,
    this.curvedButtonUnSelectedColor = Colors.white,
    this.curvedButtonSelectedColor = Colors.red,
    this.buttonBorderRadius = 10,
    this.buttonWidth = 50,
    this.buttonHeight = 50,
    this.elevation = 0,
  }) : super(key: key);

  @override
  State<CurvedBottomNavigation> createState() => _CurvedBottomNavigationState();
}

class _CurvedBottomNavigationState extends State<CurvedBottomNavigation> {
  Widget selectedScreen(int currentIndex) {
    final screen = Scaffold(body: widget.screenList.elementAt(currentIndex));
    return screen;
  }

  void changeIndex(int index) {
    widget.initIndex = index;
    widget.currentIndex(widget.initIndex);
    setState(() {});
  }

  Color changeColorOfSelectedIndex(int index) {
    if (widget.initIndex == index) {
      return widget.selectedColor;
    } else {
      return widget.unSelectedColor;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.screenList.length.isOdd && widget.screenList.length == 3 ||
        widget.screenList.length == 5) {
    } else if (widget.screenList.length != widget.buttonWidgetList.length) {
      throw Exception('screenList.length must equal buttonWidgetList.length');
    } else if (widget.screenList.length != 3 || widget.screenList.length != 5) {
      throw Exception('screenList.length must equal 3 or 5');
    } else if (widget.buttonWidgetList.length != 3 ||
        widget.buttonWidgetList.length != 5) {
      throw Exception('buttonWidgetList.length must 3 or equal 5');
    } else {
      throw Exception('screenList.length must be 3 or 5 ');
    }
  }

  @override
  Widget build(BuildContext context) {
    final lengthIsFive = widget.screenList.length == 5 ? true : false;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          selectedScreen(widget.initIndex),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * .10,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 120),
                    painter: PainterCenterBottomNavigation(
                      color: widget.color,
                      elevation: widget.elevation,
                    ),
                  ),
                  Center(
                    heightFactor: .8,
                    child: FloatingActionButton(
                      backgroundColor: lengthIsFive
                          ? widget.initIndex == 2
                              ? widget.curvedButtonSelectedColor
                              : widget.curvedButtonUnSelectedColor
                          : widget.initIndex == 1
                              ? widget.curvedButtonSelectedColor
                              : widget.curvedButtonUnSelectedColor,
                      onPressed: () => changeIndex(lengthIsFive ? 2 : 1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: widget.buttonWidgetList
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
                          icon: widget.buttonWidgetList.elementAt(0),
                          color: changeColorOfSelectedIndex(0),
                        ),
                        Visibility(
                          visible: lengthIsFive,
                          child: buttonOfBottomNavigation(
                            onTap: () => changeIndex(lengthIsFive ? 1 : 0),
                            icon: widget.buttonWidgetList
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
                            icon: widget.buttonWidgetList
                                .elementAt(lengthIsFive ? 3 : 0),
                            color: changeColorOfSelectedIndex(
                                lengthIsFive ? 3 : 0),
                          ),
                        ),
                        buttonOfBottomNavigation(
                          onTap: () => changeIndex(lengthIsFive ? 4 : 2),
                          icon: widget.buttonWidgetList
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
          borderRadius: BorderRadius.circular(widget.buttonBorderRadius),
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
