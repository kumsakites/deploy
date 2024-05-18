import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  final String recipientEmail = 'kumsakitessa17@gmail.com';

  _launchEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: recipientEmail,
      queryParameters: {'subject': 'Hello from a cinema user!'},
    );

    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }

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
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: GetSize.getScreenWidthDevice(20)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: GetSize.getScreenHeightDevice(40)),
                Row(
                  children: [
                    Icon(Icons.email_rounded, color: Styles.textColor),
                    SizedBox(
                      width: GetSize.getScreenWidthDevice(20),
                    ),
                    InkWell(
                      onTap: () {
                        launch('mailto:kumsakitessa17@gmail.com');
                      },
                      child: Text(
                        'Email'.tr,
                        style: TextStyle(
                          color: Styles.kbtc,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Row(
                  children: [
                    Icon(Icons.phone, color: Styles.textColor),
                    SizedBox(
                      width: GetSize.getScreenWidthDevice(20),
                    ),
                    InkWell(
                      onTap: () {
                        launch('tel:+251717534343');
                      },
                      child: Text(
                        'Call'.tr,
                        style: TextStyle(
                          color: Styles.kbtc,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Row(
                  children: [
                    Icon(Icons.facebook, color: Styles.textColor),
                    SizedBox(
                      width: GetSize.getScreenWidthDevice(20),
                    ),
                    InkWell(
                      onTap: () {
                        launch('https://www.facebook.com/kumsa.kitessa');
                      },
                      child: Text(
                        'Facebook'.tr,
                        style: TextStyle(
                          color: Styles.kbtc,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Row(
                  children: [
                    Icon(Icons.contact_page, color: Styles.textColor),
                    SizedBox(
                      width: GetSize.getScreenWidthDevice(20),
                    ),
                    InkWell(
                      onTap: () {
                        launch(
                            'https://www.linkedin.com/in/kumsa-bayissa-2b3300232?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app');
                      },
                      child: Text(
                        'Linkedin'.tr,
                        style: TextStyle(
                          color: Styles.kbtc,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Row(
                  children: [
                    Icon(
                      Icons.tiktok,
                      color: Styles.textColor,
                    ),
                    SizedBox(
                      width: GetSize.getScreenWidthDevice(20),
                    ),
                    InkWell(
                      onTap: () {
                        launch(
                            'https://www.tiktok.com/@kumsakitessa?_t=8k4RmUf72Wc&_r=1');
                      },
                      child: Text(
                        'Ticktok'.tr,
                        style: TextStyle(
                          color: Styles.kbtc,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(40)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
