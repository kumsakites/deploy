import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/provider/theme_provider.dart';
import 'package:ticketing/screens/signup_page.dart';
import 'package:ticketing/utils/app_styles.dart';
import 'package:ticketing/utils/getSize.dart';

import '../Controllers/password_reset_controller.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
                key: _formfield,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('images/cinema.jpg'),
                      radius: 100.0,
                    ),
                    SizedBox(
                      height: GetSize.getScreenHeightDevice(60),
                    ),
                    Container(
                      width: double.infinity,
                      height: GetSize.getScreenHeightDevice(62),
                      //margin: EdgeInsets.only(left: 20,right: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: currentTheme.colorScheme
                              .onBackground, // Set the text color to red
                        ),
                        controller: emailController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: currentTheme.colorScheme.onBackground,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                          ),
                          filled: true,
                          fillColor: Styles.ktxtf,
                          labelText: 'Email'.tr,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: currentTheme.colorScheme.onBackground,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: GetSize.getScreenHeightDevice(10),
                              horizontal: GetSize.getScreenWidthDevice(
                                  15)), // Adjust as needed
                          isDense: true, // Reduce overall height
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
                    ),
                    SizedBox(
                      height: GetSize.getScreenHeightDevice(10),
                    ),
                    Container(
                      width: double.infinity,
                      height: GetSize.getScreenHeightDevice(62),
                      //margin: EdgeInsets.only(left: 20,right: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: passwordController,
                        obscureText: passToggle,
                        style: TextStyle(
                          color: currentTheme.colorScheme
                              .onBackground, // Set the text color to red
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: currentTheme.colorScheme.onBackground,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                          ),
                          filled: true,
                          fillColor: Styles.ktxtf,
                          labelText: 'Password'.tr,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: currentTheme.colorScheme.onBackground,
                          ),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(
                              passToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: currentTheme.colorScheme.onBackground,
                            ),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: GetSize.getScreenHeightDevice(8),
                              horizontal: GetSize.getScreenWidthDevice(
                                  8)), // Adjust as needed
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password'.tr;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: GetSize.getScreenHeightDevice(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PasswordResetPage()));
                            },
                            child: Text(
                              'Forgot password?'.tr,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: currentTheme.colorScheme.onBackground),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: GetSize.getScreenHeightDevice(10),
                    ),
                    InkWell(
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          emailController.clear();
                          passwordController.clear();
                        }
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
                            'Log In'.tr,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: currentTheme.colorScheme.onBackground),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: GetSize.getScreenHeightDevice(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member?".tr,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Styles.textColor),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: Text(
                              'Sign Up'.tr,
                              style: TextStyle(
                                  color: Styles.btntColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
