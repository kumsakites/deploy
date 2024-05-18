import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import 'contact_us.dart';
import 'privacy_policy.dart';
import 'via_socila_media.dart';

class AboutMovie extends StatefulWidget {
  const AboutMovie({super.key});

  @override
  State<AboutMovie> createState() => _AboutMovieState();
}

class _AboutMovieState extends State<AboutMovie> {
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
          title: Text(
            'About Movie'.tr,
            style: TextStyle(
              color: currentTheme.colorScheme.onBackground,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(20)),
            child: Column(children: [
              SizedBox(
                height: GetSize.getScreenHeightDevice(40),
              ),
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/where.jpg'),
                  radius: 50.0,
                ),
              ),
              SizedBox(
                height: GetSize.getScreenHeightDevice(20),
              ),
              Text(
                'Movier v5.7.8'.tr,
                style: TextStyle(
                  color: currentTheme.colorScheme.onBackground,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: GetSize.getScreenHeightDevice(40),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyAndPolicy()));
                },
                child: Row(
                  children: [
                    Text(
                      'Privacy and Policy'.tr,
                      style: TextStyle(
                        color: currentTheme.colorScheme.onBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ],
                ),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactUS()));
                },
                child: Row(
                  children: [
                    Text(
                      'Contact Us'.tr,
                      style: TextStyle(
                        color: currentTheme.colorScheme.onBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // Handle forward arrow
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              Row(
                children: [
                  Text(
                    'Partner'.tr,
                    style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Handle forward arrow
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              Row(
                children: [
                  Text(
                    'Accessibility'.tr,
                    style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Handle forward arrow
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              Row(
                children: [
                  Text(
                    'Feedback'.tr,
                    style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Handle forward arrow
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              Row(
                children: [
                  Text(
                    'Rate Us'.tr,
                    style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Handle forward arrow
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Visit Our Website'.tr,
                      style: TextStyle(
                        color: currentTheme.colorScheme.onBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Handle forward arrow
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SocialMedia()));
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Follow Us On Social Media'.tr,
                        style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // Handle forward arrow
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(60)),
            ]),
          ),
        ),
      ),
    );
  }
}
