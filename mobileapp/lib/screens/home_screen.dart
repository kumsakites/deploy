import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/screens/login_page.dart';
import 'package:ticketing/screens/where_u_w_to_go.dart';
import 'package:ticketing/utils/app_styles.dart';
import 'package:ticketing/utils/getSize.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String telegramGroupLink = "https://t.me/Haramaya2024";
  void _joinTelegramGroup() async {
    if (await canLaunch(telegramGroupLink)) {
      await launch(telegramGroupLink);
    } else {
      throw 'Could not launch $telegramGroupLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;

    return Theme(
      data: currentTheme,
      child: Scaffold(
          //backgroundColor: Styles.bgColor,
          backgroundColor: currentTheme.colorScheme.background,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: GetSize.getScreenWidthDevice(15)),
              child: Column(children: [
                SizedBox(
                  height: GetSize.getScreenHeightDevice(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'images/cenema.png', // Replace with your image URL
                        width: GetSize.getScreenWidthDevice(
                            200), // Adjust the size as needed
                        height: GetSize.getScreenHeightDevice(200),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(30),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Welcome to\nmovie booker'.tr,
                              style: TextStyle(
                                color: currentTheme.colorScheme.onBackground,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.09,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: GetSize.getScreenHeightDevice(30),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Discover and book cinema tickets with ease'.tr,
                              style: TextStyle(
                                color: currentTheme.colorScheme.onBackground,
                                fontSize: MediaQuery.of(context).size.width *
                                    0.04, // Adjust the multiplier as needed
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(GetSize.getScreenHeightDevice(50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Center(
                        child: ClipOval(
                          child: Image.asset(
                            'images/facebook.jpg', // Replace with your first image asset
                            width: GetSize.getScreenWidthDevice(50),
                            height: GetSize.getScreenHeightDevice(50),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: GetSize.getScreenWidthDevice(20),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Center(
                        child: ClipOval(
                          child: Image.asset(
                            'images/gog.png', // Replace with your first image asset
                            width: GetSize.getScreenWidthDevice(40),
                            height: GetSize.getScreenHeightDevice(40),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogInPage()),
                        );
                      },
                      child: Container(
                        height: GetSize.getScreenHeightDevice(40),
                        width: GetSize.getScreenWidthDevice(130),
                        decoration: BoxDecoration(
                          color: Styles.kbtc,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          'Log in'.tr,
                          style: TextStyle(
                              color: Styles.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: _joinTelegramGroup,
                      child: Container(
                        height: GetSize.getScreenHeightDevice(40),
                        width: GetSize.getScreenWidthDevice(130),
                        decoration: BoxDecoration(
                          color: Styles.kbtnw,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          'Join now'.tr,
                          style: TextStyle(
                              color: Styles.kfbtn, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
                Gap(GetSize.getScreenHeightDevice(50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WhereYouWntGo()),
                        );
                      },
                      child: Center(
                        child: Text(
                          'Continue as a guest'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(40),
                ),
              ]),
            ),
          )),
    );
  }
}
