import 'package:bottom_navigation/enums.dart';
import 'package:flutter/material.dart';
import 'painter_bottom_navigation.dart';

// ignore: must_be_immutable
class CurvedBottomNavigationAN extends StatefulWidget {
  final List<Widget> screenItems, buttonItems;
  final void Function(int index) currentIndex;
  final VoidCallback? onTapCurvedButton;
  final double buttonRadius, buttonWidth, buttonHeight, elevation, heightFactor;
  int initIndex;
  final double? bottomNavHeight, curvedButtonHeight;
  final BottomNavStyle bottomNavStyle;
  final BoxDecoration? curvedButtonDecoration;
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
    this.bottomNavStyle = BottomNavStyle.styleCenter,
    this.bottomNavHeight,
    this.curvedButtonDecoration,
    this.onTapCurvedButton,
    this.curvedButtonHeight,
  }) : super(key: key);

  @override
  State<CurvedBottomNavigationAN> createState() =>
      _CurvedBottomNavigationANState();
}

class _CurvedBottomNavigationANState extends State<CurvedBottomNavigationAN> {
  late int _currentIndex;

  Widget _selectedScreen(int currentIndex) {
    final screen = Scaffold(body: widget.screenItems.elementAt(currentIndex));
    return screen;
  }

  void _changeIndex(int index) {
    widget.initIndex = index;
    _currentIndex = index;
    widget.currentIndex(widget.initIndex);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initIndex;
    _exceptionHandler(
      screenItems: widget.screenItems,
      buttonItems: widget.buttonItems,
    );
  }

  @override
  void didUpdateWidget(covariant CurvedBottomNavigationAN oldWidget) {
    super.didUpdateWidget(oldWidget);
    _exceptionHandler(
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
          _selectedScreen(_currentIndex),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: widget.bottomNavHeight ?? size.height * .10,
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
                  Center(
                    heightFactor: widget.heightFactor,
                    child: InkWell(
                      onTap: () {
                        _changeIndex(lengthIsFive ? 2 : 1);
                        widget.onTapCurvedButton == null
                            ? () {}
                            : widget.onTapCurvedButton!();
                      },
                      child: Container(
                        width: widget.curvedButtonHeight ?? size.width * .15,
                        decoration: widget.curvedButtonDecoration ??
                            BoxDecoration(
                              color: _curvedButtonColor(),
                              shape: BoxShape.circle,
                            ),
                        child: Center(
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
                        _buttonOfBottomNavigation(
                          onTap: () => _changeIndex(0),
                          icon: widget.buttonItems.elementAt(0),
                          color: _changeColorOfSelectedIndex(0),
                        ),
                        Visibility(
                          visible: lengthIsFive,
                          child: _buttonOfBottomNavigation(
                            onTap: () => _changeIndex(lengthIsFive ? 1 : 0),
                            icon: widget.buttonItems
                                .elementAt(lengthIsFive ? 1 : 0),
                            color: _changeColorOfSelectedIndex(
                                lengthIsFive ? 1 : 0),
                          ),
                        ),
                        SizedBox(width: size.width * .20),
                        Visibility(
                          visible: lengthIsFive,
                          child: _buttonOfBottomNavigation(
                            onTap: () => _changeIndex(lengthIsFive ? 3 : 0),
                            icon: widget.buttonItems
                                .elementAt(lengthIsFive ? 3 : 0),
                            color: _changeColorOfSelectedIndex(
                              lengthIsFive ? 3 : 0,
                            ),
                          ),
                        ),
                        _buttonOfBottomNavigation(
                          onTap: () => _changeIndex(lengthIsFive ? 4 : 2),
                          icon: widget.buttonItems
                              .elementAt(lengthIsFive ? 4 : 2),
                          color:
                              _changeColorOfSelectedIndex(lengthIsFive ? 4 : 2),
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

  Color _curvedButtonColor() {
    final lengthIsFive = widget.screenItems.length == 5 ? true : false;
    if (lengthIsFive) {
      if (_currentIndex == 2) {
        return widget.curvedButtonSelectedColor;
      } else {
        return widget.curvedButtonUnSelectedColor;
      }
    } else {
      if (_currentIndex == 1) {
        return widget.curvedButtonUnSelectedColor;
      } else {
        return widget.curvedButtonUnSelectedColor;
      }
    }
  }

  Color _changeColorOfSelectedIndex(int index) {
    if (_currentIndex == index) {
      return widget.selectedColor;
    } else {
      return widget.unSelectedColor;
    }
  }

  void _exceptionHandler({
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
