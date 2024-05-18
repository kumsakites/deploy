import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ticketing/components/curvedNavigation.dart';
import 'package:ticketing/utils/app_styles.dart';
import 'package:ticketing/utils/getSize.dart';

import '../screens/cinema_page.dart';
import '../screens/explore_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int index = 0;
  final screens = [
    CinemaPage(),
    SearchPage(),
    ExplorePage(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      CustomCurvedNavigationBarItem(
        
        label: 'Home'.tr,
        backgroundColor:  Styles.kbtc, 
        icon: Icons.home,
      ),
      CustomCurvedNavigationBarItem(
        
        label: 'Search'.tr,
        backgroundColor:  Styles.kbtc, icon: Icons.search,
      ),
      CustomCurvedNavigationBarItem(
       
        label: 'Explore'.tr,
        backgroundColor:  Styles.kbtc, icon: Icons.explore,
      ),
      CustomCurvedNavigationBarItem(
       
        label: 'Person'.tr,
        backgroundColor:  Styles.kbtc, icon: Icons.person,
      ),
    ];

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Styles.textColor),
            textTheme: TextTheme(
              bodyText1: TextStyle(color: Styles.textColor),
            )),
        child: CurvedNavigationBar(
          color:  Styles.kbtc,
          items: items,
          index: index,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor:  Styles.kbtc,
          height: GetSize.getScreenHeightDevice(60),
          onTap: (index) => setState(() {
            this.index = index;
          }),
        ),
      ),
      body: screens[index],
    );
  }
}
