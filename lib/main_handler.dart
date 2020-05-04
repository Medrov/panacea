import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:panacea/main_handler_children/add_plants.dart';
import 'package:panacea/main_handler_children/home.dart';
import 'package:panacea/main_handler_children/leaderboard.dart';
import 'package:panacea/main_handler_children/settings.dart';
import 'package:panacea/res/my_icons.dart' as custicon;
class MainHandler extends StatefulWidget {
  @override
  _MainHandlerState createState() => _MainHandlerState();
}

class _MainHandlerState extends State<MainHandler> with SingleTickerProviderStateMixin {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  bool isBeing1 = false; bool isBeing2 = true; bool isBeing3 = true; bool isBeing4 = true;
  var screens = [
    HomeScreen(),
    AddPlantsScreen(),
    LeaderBoardScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          buttonBackgroundColor: Color(0xff428FFC),
          color: Colors.white,
          items: <Widget>[
            Icon(Icons.home, size: 33, color: isBeing1 ? Colors.black : Colors.white),
            Icon(Icons.add, size: 33, color: isBeing2 ? Colors.black : Colors.white),
            Icon(Icons.work, size: 33, color: isBeing3 ? Colors.black : Colors.white),
            Icon(Icons.settings, size: 33, color: isBeing4 ? Colors.black : Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
              if(_page == 0){
                isBeing1 = false; isBeing2 = true; isBeing3 = true; isBeing4 = true;
              }
              if(_page == 1){
                isBeing1 = true; isBeing2 = false; isBeing3 = true; isBeing4 = true;
              }
              if(_page == 2){
                isBeing1 = true; isBeing2 = true; isBeing3 = false; isBeing4 = true;
              }
              if(_page == 3){
                isBeing1 = true; isBeing2 = true; isBeing3 = true; isBeing4 = false;
              }
              print(index);

            });
          },
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(
                child: child,
                scale: animation,
              ),
          switchInCurve: Curves.easeInOutExpo,
          switchOutCurve: Curves.easeInOutExpo,
          child: PageStorage(
            key: ValueKey<int>(_page),
            child: screens[_page],
            bucket: PageStorageBucket(),
          ),
        ));
  }
}
