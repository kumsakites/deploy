import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import 'Change_password.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool switchValue1 = false;
  bool switchValue2 = false;
  bool switchValue3 = false;
  bool switchValue4 = false;
  bool switchValue5 = false;
  bool switchValue6 = false;
  bool switchValue7 = false;
  bool switchValue8 = false;
  bool switchValue9 = false;
  bool switchValue10 = false;
  bool switchValue11 = false;
  // Add more bool variables for additional switches if needed

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
                'Security'.tr,
                style: TextStyle(
                    color: currentTheme.colorScheme.onBackground,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'),
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
                buildSwitchRow('Remember me'.tr, switchValue1, (value) {
                  setState(() {
                    switchValue1 = value;
                  });
                }),
                buildSwitchRow('Biometric ID'.tr, switchValue2, (value) {
                  setState(() {
                    switchValue2 = value;
                  });
                }),
                buildSwitchRow('Face ID'.tr, switchValue3, (value) {
                  setState(() {
                    switchValue3 = value;
                  });
                }),
                buildSwitchRow('SMS Authentication'.tr, switchValue4, (value) {
                  setState(() {
                    switchValue4 = value;
                  });
                }),
                buildSwitchRow('Google Authentication'.tr, switchValue5,
                    (value) {
                  setState(() {
                    switchValue5 = value;
                  });
                }),
                buildSwitchRow('Device Management'.tr, switchValue6, (value) {
                  setState(() {
                    switchValue6 = value;
                  });
                }),

                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Device Management'.tr.tr,
                      style: TextStyle(
                          color: Styles.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SecurityPage())); // Handle forward arrow
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(40),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChangePassw()));
                  },
                  child: Container(
                    height: GetSize.getScreenHeightDevice(50),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Styles.kbtnw,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      'Change Password'.tr,
                      style: TextStyle(
                          color: Styles.kbtc,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ), // Add more switch rows as needed
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSwitchRow(
      String title, bool switchValue, ValueChanged<bool> onChanged) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return Theme(
      data: currentTheme,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: currentTheme.colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto'),
              ),
              Switch(
                value: switchValue,
                onChanged: onChanged,
                activeTrackColor: Styles.kbtc, // Color when switch is ON
                inactiveTrackColor: Styles.kbtnw, // Color when switch is OFF
                activeColor: Colors.white, // Thumb color when switch is ON
                inactiveThumbColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
