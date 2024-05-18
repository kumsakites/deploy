import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/app_styles.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';

class PrivacyAndPolicy extends StatefulWidget {
  const PrivacyAndPolicy({super.key});

  @override
  State<PrivacyAndPolicy> createState() => _PrivacyAndPolicyState();
}

class _PrivacyAndPolicyState extends State<PrivacyAndPolicy> {
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
            'Privacy and Policy'.tr,
            style: TextStyle(
              color: currentTheme.colorScheme.onBackground,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: GetSize.getScreenWidthDevice(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: GetSize.getScreenHeightDevice(40)),
                Text(
                  'The privacy and policies related to online cinema ticket booking can vary among different platforms and service providers. However, there are common elements that are typically addressed in such policies. Here are some general aspects you might find in the privacy and policies of online cinema ticket booking platforms:'
                      .tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information Collection'.tr,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Text(
                  'The policies usually outline what types of personal information will be collected during the booking process. This may include details such as your name, contact information, payment details, and sometimes demographic information.'
                      .tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Data Usage'.tr,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Text(
                  'Platforms typically specify how they will use the collected information. This can include processing your ticket orders, sending you relevant notifications, and possibly using the data for marketing purposes.'
                      .tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Security Measures'.tr,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Text(
                  'The policies often describe the security measures in place to protect your personal information. This may include encryption methods for sensitive data and secure payment gateways.'
                      .tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Cookies and Tracking'.tr,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Text(
                  'Platforms may use cookies or other tracking technologies to enhance user experience and gather information about website usage. The policies usually explain the purpose of such technologies and how you can manage your preferences.'
                      .tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Third-Party Sharing'.tr,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Text(
                  'The policies often state whether the platform shares your information with third parties. This can include sharing data with cinema partners or other service providers.'
                      .tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Retention Period'.tr,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Text(
                  'Platforms usually specify how long they will retain your personal information. This can vary depending on legal requirements and business needs.'
                      .tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'User Rights'.tr,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Text(
                  'Your rights regarding your personal information are often outlined in the policies. This may include the right to access, correct, or delete your data.'
                      .tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Legal Compliance'.tr,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Text(
                  'Platforms typically outline their commitment to complying with relevant data protection laws and regulations.'
                      .tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                Text(
                  'It is important to carefully read the privacy policy of the specific online cinema ticket booking platform you are using to ensure you understand how your data is being handled and to make an informed decision about using the service. If you have specific concerns or questions, you may also reach out to the platform customer support for clarification'
                      .tr,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto'),
                  textAlign: TextAlign.justify,
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
