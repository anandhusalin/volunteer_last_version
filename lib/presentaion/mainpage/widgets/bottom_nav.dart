import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(2);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return SizedBox(
            height: 67,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CurvedNavigationBar(
                  index: 2,
                  height: 55,
                  animationCurve: Curves.ease,
                  backgroundColor: Colors.white,
                  buttonBackgroundColor: Colors.orange[800],
                  color: primaryColor,
                  onTap: (index) {
                    indexChangeNotifier.value = index;
                  },
                  items: const [
                    Icon(
                      Icons.account_circle,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.home,
                      size: 40,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.white,
                    ),
                  ]),
            ),
          );
        });
  }
}
