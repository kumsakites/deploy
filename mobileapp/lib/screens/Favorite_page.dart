import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/provider/theme_provider.dart';
import 'package:ticketing/utils/getSize.dart';
import '../utils/app_styles.dart';
import '../utils/dark_theme.dart';
import '../utils/light_theme.dart';

class ChoosingCinema extends StatefulWidget {
  bool isDarkMode = false;
  ChoosingCinema({Key? key}) : super(key: key);

  @override
  State<ChoosingCinema> createState() => _ChoosingCinemaState();
}

class _ChoosingCinemaState extends State<ChoosingCinema> {
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
          title: Text(
            'Choose Cinema'.tr,
            style: TextStyle(
              color: currentTheme.colorScheme.onBackground,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),
          ),
          backgroundColor: currentTheme.colorScheme.background,
        ),
        body: DefaultTabController(
          length: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(20)),
            child: Column(
              children: [
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Styles.textColor,
                    ),
                    Text(
                      "Your location".tr,
                      style: TextStyle(
                        color: currentTheme.colorScheme.onBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      "Addis Ababa".tr,
                      style: TextStyle(
                        color: currentTheme.colorScheme.onBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(
                      height: GetSize.getScreenHeightDevice(40),
                    ),
                  ],
                ),
                TabBar(
                  dividerColor: currentTheme.colorScheme.onBackground,
                  tabs: [
                    Tab(
                      child: Text('All Cinema'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontFamily: 'Roboto')),
                    ),
                    Tab(
                      child: Text('Favorite'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontFamily: 'Roboto')),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: GetSize.getScreenHeightDevice(40)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    Icons.star_border,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(20)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    Icons.star_rate,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(20)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    Icons.star_border,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(20)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    Icons.star_rate,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(20)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    Icons.star_border,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(20)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    Icons.star_rate,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(20)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    //Icons.star_rate_outlined,
                                    Icons.star_border,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(20)),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: GetSize.getScreenHeightDevice(40)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle movie interest
                                  },
                                  child: Icon(
                                    Icons.star_border,
                                    size: 30,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                SizedBox(
                                    width: GetSize.getScreenWidthDevice(20)),
                                Text(
                                  'Alem Cinema'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // Handle forward arrow
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
