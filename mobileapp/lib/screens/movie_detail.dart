import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/app_styles.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return Theme(
      data: currentTheme,
      child: Scaffold(
        backgroundColor: currentTheme.colorScheme.background,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("images/cenema.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      right: 15,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Coming of the robot".tr,
                                style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue.shade600),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Watch".tr,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star_border, color: Colors.amber),
                              Icon(Icons.star_border, color: Colors.amber),
                              Icon(Icons.star_border, color: Colors.amber),
                              Icon(Icons.star_border, color: Colors.amber)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(10),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genre".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: currentTheme.colorScheme.onBackground),
                        ),
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(5),
                        ),
                        Text(
                          "Action, Sci-fi".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: currentTheme.colorScheme.onBackground),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: currentTheme.colorScheme.onBackground),
                        ),
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(5),
                        ),
                        Text(
                          "250/seat".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: currentTheme.colorScheme.onBackground),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: GetSize.getScreenWidthDevice(70),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 3),
                  child: Text(
                    "Showtime".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: currentTheme.colorScheme.onBackground),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 8),
                  child: Text(
                    "10:30 pm-12:00pm at \n Alem cinema".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: currentTheme.colorScheme.onBackground),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: GetSize.getScreenWidthDevice(15),
                      top: GetSize.getScreenHeightDevice(8)),
                  child: Text(
                    "9:30 pm-11:00pm \n At ednamol cinema",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: currentTheme.colorScheme.onBackground),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 8),
                  child: Text(
                    "3:20 am-11:00am \n At cinema",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: currentTheme.colorScheme.onBackground),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 8),
                  child: Text(
                    "Description".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: currentTheme.colorScheme.onBackground),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 8),
                  child: Text(
                    "In a not-so-distant future, society teeters on the brink of chaos as a brilliant scientist unleashes a groundbreaking artificial intelligence. .  task force is deployed to control the evolving situation. What ensues is a high-stakes game of cat and mouse, where humanity's fate hangs in the balance."
                        .tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: currentTheme.colorScheme.onBackground),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
