import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import '../utils/getSize.dart';

class UpdateInfo extends StatefulWidget {
  const UpdateInfo({super.key});

  @override
  State<UpdateInfo> createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
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
          title: Row(
            children: [
              Text(
                'Notification'.tr,
                style: TextStyle(
                    color: currentTheme.colorScheme.onBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'),
              ),
              SizedBox(
                width: GetSize.getScreenWidthDevice(80),
              ),
              IconButton(
                icon: Icon(Icons.settings,
                    color: currentTheme.colorScheme.onBackground),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UpdateInfo())); // Start QR code scanner on QR icon press
                },
              ),
            ],
          ),
          backgroundColor: currentTheme.colorScheme.background,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(20)),
            child: Column(
              children: [
                SizedBox(
                  height: GetSize.getScreenHeightDevice(40),
                ),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'Today'.tr,
                      style: Styles.headLineStyle3,
                    ),
                    Expanded(
                      child: Divider(
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(30),
                ),
                Row(
                  children: [
                    Icon(Icons.settings,
                        color: currentTheme.colorScheme.onBackground),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Expanded(
                      child: Text(
                        'New Update Available! Update Movier and get a better cinematic experience \nat 09:40 AM.'
                            .tr,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily:
                              'Roboto', // Optional: Use the desired font family
                        ),
                      ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(30),
                ),
                Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'images/kumsa.jpg',
                      width: GetSize.getScreenWidthDevice(40),
                      height: GetSize.getScreenHeightDevice(40),
                      fit: BoxFit.cover,
                    )),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Expanded(
                      child: Text(
                        'Deadpol will be playing this afternoon at vadmad cinema \nat 09:40 AM.'
                            .tr,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily:
                              'Roboto', // Optional: Use the desired font family
                        ),
                      ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(40),
                ),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'Yesterday'.tr,
                      style: Styles.headLineStyle3,
                    ),
                    Expanded(
                      child: Divider(
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(30),
                ),
                Row(
                  children: [
                    Icon(Icons.settings,
                        color: currentTheme.colorScheme.onBackground),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Expanded(
                      child: Text(
                        'New Update Available! Update Movier and get a better cinematic experience \nat 09:40 AM.'
                            .tr,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily:
                              'Roboto', // Optional: Use the desired font family
                        ),
                      ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(30),
                ),
                Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'images/kumsa.jpg',
                      width: GetSize.getScreenWidthDevice(40),
                      height: GetSize.getScreenHeightDevice(40),
                      fit: BoxFit.cover,
                    )),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Expanded(
                      child: Text(
                        'Deadpol will be playing this afternoon at vadmad cinema \nat 09:40 AM.'
                            .tr,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily:
                              'Roboto', // Optional: Use the desired font family
                        ),
                      ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(40),
                ),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'Apr, 2024'.tr,
                      style: Styles.headLineStyle3,
                    ),
                    Expanded(
                      child: Divider(
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(40),
                ),
                Row(
                  children: [
                    Icon(Icons.settings,
                        color: currentTheme.colorScheme.onBackground),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Expanded(
                      child: Text(
                        'New Update Available! Update Movier and get a better cinematic experience \nat 09:40 AM.'
                            .tr,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily:
                              'Roboto', // Optional: Use the desired font family
                        ),
                      ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
