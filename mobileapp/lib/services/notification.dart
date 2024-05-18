import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../Controllers/update_info.dart';
import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  'Notification'.tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontSize: 25,
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
                buildSwitchRow('Booking Confirmation'.tr, switchValue1,
                    (value) {
                  setState(() {
                    switchValue1 = value;
                  });
                }),
                buildSwitchRow('Ticket Reminder'.tr, switchValue2, (value) {
                  setState(() {
                    switchValue2 = value;
                  });
                }),
                buildSwitchRow('Seat Availability Alert'.tr, switchValue3,
                    (value) {
                  setState(() {
                    switchValue3 = value;
                  });
                }),
                buildSwitchRow('Order Update'.tr, switchValue4, (value) {
                  setState(() {
                    switchValue4 = value;
                  });
                }),
                buildSwitchRow('Cinema Rating'.tr, switchValue5, (value) {
                  setState(() {
                    switchValue5 = value;
                  });
                }),
                buildSwitchRow('Booking Confirmation'.tr, switchValue6,
                    (value) {
                  setState(() {
                    switchValue6 = value;
                  });
                }),
                buildSwitchRow('Booking Confirmation'.tr, switchValue7,
                    (value) {
                  setState(() {
                    switchValue7 = value;
                  });
                }),
                buildSwitchRow('Booking Confirmation'.tr, switchValue8,
                    (value) {
                  setState(() {
                    switchValue8 = value;
                  });
                }),
                buildSwitchRow('Booking Confirmation'.tr, switchValue9,
                    (value) {
                  setState(() {
                    switchValue9 = value;
                  });
                }),
                buildSwitchRow('Booking Confirmation'.tr, switchValue10,
                    (value) {
                  setState(() {
                    switchValue10 = value;
                  });
                }),
                buildSwitchRow('Booking Confirmation'.tr, switchValue11,
                    (value) {
                  setState(() {
                    switchValue11 = value;
                  });
                }),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(40),
                ),
                // Add more switch rows as needed
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
      child: Row(
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
            activeColor: Styles.textColor, // Thumb color when switch is ON
            inactiveThumbColor: Styles.textColor,
          ),
        ],
      ),
    );
  }
}
