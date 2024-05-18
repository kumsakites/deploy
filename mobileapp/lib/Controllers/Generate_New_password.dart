import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passToggle = true;

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
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              // First Row
              Text(
                'Create new password'.tr,
                style: TextStyle(
                    color: currentTheme.colorScheme.onBackground,
                    fontFamily: 'Roboto',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(16)),

              // Second Row
              Text(
                'Create your new password make sure it contains 6 characters, numbers, and special symbols'
                    .tr,
                style: Styles.headLineStyle3,
              ),

              SizedBox(height: GetSize.getScreenHeightDevice(40)),
              Container(
                width: double.infinity,
                height: GetSize.getScreenHeightDevice(62),
                //margin: EdgeInsets.only(left: 20,right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passwordController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Styles.kinp,
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
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: GetSize.getScreenHeightDevice(8),
                        horizontal: GetSize.getScreenWidthDevice(
                            8)), // Adjust as needed
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'password'.tr;
                    }
                  },
                ),
              ),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: confirmPasswordController,
                obscureText: passToggle,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Styles.kinp,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                  ),

                  filled: true,
                  fillColor: Styles.ktxtf,
                  labelText: 'Confirm Password'.tr,
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
                      passToggle ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: GetSize.getScreenHeightDevice(8),
                      horizontal:
                          GetSize.getScreenWidthDevice(8)), // Adjust as needed
                  isDense: true, // Reduce overall height
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Confirm password'.tr;
                  } else if (value != passwordController.text) {
                    return 'Passwords do not match'.tr;
                  }
                },
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),

              // Fifth Row

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenWidthDevice(15)),
                child: InkWell(
                  onTap: () {
                    showResetPasswordDialog(context);
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

  void showResetPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black, // Set background color to black
          title: Row(
            children: [
              Icon(
                Icons.lock,
                color: Colors.blue, // Set icon color to blue
              ),
              SizedBox(width: 10),
              Expanded(
                // Wrap the text with Expanded
                child: Text(
                  'Reset Password Successful'.tr,
                  style: TextStyle(
                    color: Colors.blue, // Set text color to blue
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add any additional actions here
              },
              child: Text('OK'.tr),
            ),
          ],
        );
      },
    );
  }
}
