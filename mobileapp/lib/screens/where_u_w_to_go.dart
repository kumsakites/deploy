import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../components/Navigation_menu.dart';
import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';

class WhereYouWntGo extends StatefulWidget {
  const WhereYouWntGo({super.key});

  @override
  State<WhereYouWntGo> createState() => _WhereYouWntGoState();
}

class _WhereYouWntGoState extends State<WhereYouWntGo> {
  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return Theme(
      data: currentTheme,
      child: Scaffold(
        backgroundColor: currentTheme.colorScheme.background,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: currentTheme.colorScheme.onBackground,
          ),
          backgroundColor: currentTheme.colorScheme.background,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/where.jpg'),
                radius: 100.0,
              ),
              SizedBox(
                height: GetSize.getScreenHeightDevice(40),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenWidthDevice(25)),
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Where do you want to go?".tr,
                          style: TextStyle(
                            color: currentTheme.colorScheme.onBackground,
                            fontSize: MediaQuery.of(context).size.width *
                                0.07, // Adjust the multiplier as needed
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: GetSize.getScreenHeightDevice(40),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() =>
                            NavigationMenu()); // Add your sign-up logic here
                      },
                      child: Container(
                        width: GetSize.getScreenWidthDevice(110),
                        height: GetSize.getScreenHeightDevice(60),
                        padding: EdgeInsets.symmetric(
                            horizontal: GetSize.getScreenWidthDevice(15),
                            vertical: GetSize.getScreenHeightDevice(15)),
                        decoration: BoxDecoration(
                            color: Styles.kbtc,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Cinema'.tr,
                          style: TextStyle(
                              color: Styles.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: GetSize.getScreenHeightDevice(
                          15)), // Add some spacing between buttons
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: GestureDetector(
                      onTap: () {
                        //  Get.to(()=>NavigationMenu());// Add your sign-up logic here
                      },
                      child: Container(
                        width: GetSize.getScreenWidthDevice(110),
                        height: GetSize.getScreenHeightDevice(60),
                        padding: EdgeInsets.symmetric(
                            horizontal: GetSize.getScreenWidthDevice(15),
                            vertical: GetSize.getScreenHeightDevice(15)),
                        decoration: BoxDecoration(
                            color: Styles.kbtc,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Event'.tr,
                          style: TextStyle(
                              color: Styles.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(15)),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: GestureDetector(
                      onTap: () {
                        //  Get.to(()=>NavigationMenu());// Add your sign-up logic here
                      },
                      child: Container(
                        width: GetSize.getScreenWidthDevice(110),
                        height: GetSize.getScreenHeightDevice(60),
                        padding: EdgeInsets.symmetric(
                            horizontal: GetSize.getScreenWidthDevice(15),
                            vertical: GetSize.getScreenHeightDevice(15)),
                        decoration: BoxDecoration(
                            color: Styles.kbtc,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Theatre'.tr,
                          style: TextStyle(
                              color: Styles.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: GetSize.getScreenHeightDevice(80),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
