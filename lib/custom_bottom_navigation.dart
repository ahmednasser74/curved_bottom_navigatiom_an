// import 'package:flutter/material.dart';
// import 'curved_bottom_navigation.dart';
// import 'painter_bottom_navigation.dart';
//
// // ignore: must_be_immutable
// class CustomBottomNavigation extends StatelessWidget {
//   final void Function(int index) changeIndex;
//   final List<Widget> screenList, buttonWidgetList;
//   final Color selectedColor,
//       unSelectedColor,
//       curvedButtonUnSelectedColor,
//       curvedButtonSelectedColor,
//       color;
//   // final void Function(int index) currentIndex;
//   final double buttonBorderRadius, buttonWidth, buttonHeight, elevation;
//   int initIndex;
//
//   CustomBottomNavigation({
//     Key? key,
//     required this.screenList,
//     // required this.currentIndex,
//     required this.changeIndex,
//     required this.buttonWidgetList,
//     this.selectedColor = Colors.red,
//     this.unSelectedColor = Colors.black26,
//     this.color = Colors.white,
//     this.initIndex = 0,
//     this.curvedButtonUnSelectedColor = Colors.white,
//     this.curvedButtonSelectedColor = Colors.red,
//     this.buttonBorderRadius = 10,
//     this.buttonWidth = 50,
//     this.buttonHeight = 50,
//     this.elevation = 0,
//   }) : super(key: key);
//
//
//   Color changeColorOfSelectedIndex(int index) {
//     if (initIndex == index) {
//       return selectedColor;
//     } else {
//       return unSelectedColor;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final lengthIsFive = screenList.length == 5 ? true : false;
//     Size size = MediaQuery.of(context).size;
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       child: SizedBox(
//         width: size.width,
//         height: size.height * .10,
//         child: Stack(
//           children: [
//             CustomPaint(
//               size: Size(size.width, 120),
//               painter: PainterCenterBottomNavigation(
//                 color: color,
//                 elevation: elevation,
//               ),
//             ),
//             Center(
//               heightFactor: .8,
//               child: FloatingActionButton(
//                 backgroundColor: lengthIsFive
//                     ? initIndex == 2
//                         ? curvedButtonSelectedColor
//                         : curvedButtonUnSelectedColor
//                     : initIndex == 1
//                         ? curvedButtonSelectedColor
//                         : curvedButtonUnSelectedColor,
//                 onPressed: () => changeIndex(lengthIsFive ? 2 : 1),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(28),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: buttonWidgetList.elementAt(lengthIsFive ? 2 : 1),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: size.width,
//               height: 80,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   buttonOfBottomNavigation(
//                     onTap: () => changeIndex(0),
//                     icon: buttonWidgetList.elementAt(0),
//                     color: changeColorOfSelectedIndex(0),
//                   ),
//                   Visibility(
//                     visible: lengthIsFive,
//                     child: buttonOfBottomNavigation(
//                       onTap: () => changeIndex(lengthIsFive ? 1 : 0),
//                       icon: buttonWidgetList.elementAt(lengthIsFive ? 1 : 0),
//                       color: changeColorOfSelectedIndex(lengthIsFive ? 1 : 0),
//                     ),
//                   ),
//                   SizedBox(width: size.width * .20),
//                   Visibility(
//                     visible: lengthIsFive,
//                     child: buttonOfBottomNavigation(
//                       onTap: () => changeIndex(lengthIsFive ? 3 : 0),
//                       icon: buttonWidgetList.elementAt(lengthIsFive ? 3 : 0),
//                       color: changeColorOfSelectedIndex(lengthIsFive ? 3 : 0),
//                     ),
//                   ),
//                   buttonOfBottomNavigation(
//                     onTap: () => changeIndex(lengthIsFive ? 4 : 2),
//                     icon: buttonWidgetList.elementAt(lengthIsFive ? 4 : 2),
//                     color: changeColorOfSelectedIndex(lengthIsFive ? 4 : 2),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buttonOfBottomNavigation({
//     required VoidCallback onTap,
//     required Widget icon,
//     required Color color,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       splashColor: selectedColor,
//       child: Container(
//         height: buttonHeight,
//         width: buttonWidth,
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(buttonBorderRadius),
//         ),
//         child: icon,
//       ),
//     );
//   }
// }
