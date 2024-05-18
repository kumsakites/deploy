import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/provider/theme_provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../utils/app_styles.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  //TextEditingController _reviewController = TextEditingController();
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
            'Help Center'.tr,
            style: TextStyle(
              color: currentTheme.colorScheme.onBackground,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),
          ),
          backgroundColor: currentTheme.colorScheme.background,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(20)),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Button 1 action
                        },
                        child: Text(
                          'General'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Styles.kbtc,
                        ),
                      ),
                      SizedBox(
                        width: GetSize.getScreenWidthDevice(15),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Button 2 action
                        },
                        child: Text(
                          'Account'.tr,
                          style: TextStyle(
                              color: Styles.kfbtn, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.kbtnw),
                      ),
                      SizedBox(
                        width: GetSize.getScreenWidthDevice(15),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Button 3 action
                        },
                        child: Text(
                          'Cinema'.tr,
                          style: TextStyle(
                              color: Styles.kfbtn, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.kbtnw),
                      ),
                      SizedBox(
                        width: GetSize.getScreenWidthDevice(15),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Button 4 action
                        },
                        child: Text(
                          'Payment'.tr,
                          style: TextStyle(
                              color: Styles.kfbtn, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.kbtnw),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(40)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: GetSize.getScreenHeightDevice(10),
                    horizontal: GetSize.getScreenWidthDevice(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenWidthDevice(15),
                    ),
                    decoration: BoxDecoration(
                      color: Styles.ksf,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...'.tr,
                          hintStyle: TextStyle(
                            color: Styles.ktsf,
                            fontWeight: FontWeight.w500,
                          ),
                          fillColor: Styles.ksearch,
                          prefixIcon: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.search,
                                color: Styles.ktsf,
                              )),
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.cancel_rounded,
                                color: Styles.ktsf,
                              ))),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(40)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenHeightDevice(25)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Styles.kbtn,
                        width: GetSize.getScreenWidthDevice(2),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        color: currentTheme.colorScheme.background,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'What is movier?'.tr,
                                  style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                Icon(
                                  Icons.expand_less,
                                  color: currentTheme.colorScheme.onBackground,
                                ),
                              ],
                            ),
                            SizedBox(height: GetSize.getScreenHeightDevice(16)),
                            Divider(
                              color: currentTheme.colorScheme.onBackground,
                            ),
                            Container(
                              height: GetSize.getScreenHeightDevice(100),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenHeightDevice(25)),
                  child: Container(
                    height: GetSize.getScreenHeightDevice(80),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Styles.kbtc,
                        //width: GetSize.getScreenWidthDevice(2),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        color: currentTheme.colorScheme.background,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center text vertically
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'How do I book tickets?'.tr,
                                  style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.expand_more,
                                    color:
                                        currentTheme.colorScheme.onBackground),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenHeightDevice(25)),
                  child: Container(
                    height: GetSize.getScreenHeightDevice(80),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Styles.kbtc,
                        //width: GetSize.getScreenWidthDevice(2),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        color: currentTheme.colorScheme.background,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center text vertically
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Can I modify booking?'.tr,
                                  style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.expand_more,
                                    color:
                                        currentTheme.colorScheme.onBackground),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenHeightDevice(25)),
                  child: Container(
                    height: GetSize.getScreenHeightDevice(80),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Styles.kbtc,
                        //width: GetSize.getScreenWidthDevice(2),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        color: currentTheme.colorScheme.background,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center text vertically
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'How to cancel or refund tickets?'.tr,
                                  style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.expand_more,
                                    color:
                                        currentTheme.colorScheme.onBackground),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenHeightDevice(25)),
                  child: Container(
                    height: GetSize.getScreenHeightDevice(80),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Styles.kbtc,
                        //width: GetSize.getScreenWidthDevice(2),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        color: currentTheme.colorScheme.background,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center text vertically
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Can I book my tickets once?'.tr,
                                  style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.expand_more,
                                    color:
                                        currentTheme.colorScheme.onBackground),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GetSize.getScreenHeightDevice(25)),
                  child: Container(
                    height: GetSize.getScreenHeightDevice(80),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Styles.kbtc,
                        //width: GetSize.getScreenWidthDevice(2),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        color: currentTheme.colorScheme.background,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center text vertically
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'How to report cinema issues?'.tr,
                                  style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.expand_more,
                                    color:
                                        currentTheme.colorScheme.onBackground),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(60)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
