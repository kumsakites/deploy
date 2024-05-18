import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import 'otp.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return Theme(
      data: currentTheme,
      child: Scaffold(
        backgroundColor: currentTheme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: currentTheme.colorScheme.background,
          iconTheme: IconThemeData(
            color: currentTheme.colorScheme.onBackground,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Row(
                      children: [
                        Text(
                          'Reset Your Password'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(height: GetSize.getScreenHeightDevice(16)),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Please enter your email, and we will send an OTP code in the next step to reset your password.'
                                .tr,
                            style: Styles.headLineStyle3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: GetSize.getScreenHeightDevice(16)),
                    Row(
                      children: [
                        Text(
                          'Email'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(height: GetSize.getScreenHeightDevice(8)),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Styles.ktxtf,

                        labelStyle: TextStyle(
                            color: currentTheme.colorScheme.onBackground,
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                        labelText: '', // Empty labelText
                        focusedBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   color: Color(0xFF0000FF),
                            // ),
                            ),
                        enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   color: Color(0xFF0000FF),
                            // ),
                            ),
                        // fillColor: Colors.black54,
                        // filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: currentTheme.colorScheme.onBackground,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email'.tr;
                        }
                        bool emailValid =
                            RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(value);
                        if (!emailValid) {
                          return 'Enter valid email'.tr;
                        }
                      },
                    ),
                    SizedBox(height: GetSize.getScreenHeightDevice(16)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenWidthDevice(15)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OtpPage()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: GetSize.getScreenHeightDevice(52),
                    //margin: EdgeInsets.only(left: 20,right: 20),
                    decoration: BoxDecoration(
                      color: Styles.kbtc,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Continue'.tr,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Styles.textColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(40)),
            ],
          ),
        ),
      ),
    );
  }
}
