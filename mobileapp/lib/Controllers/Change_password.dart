import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import '../utils/getSize.dart';

class ChangePassw extends StatefulWidget {
  const ChangePassw({super.key});

  @override
  State<ChangePassw> createState() => _ChangePasswState();
}

class _ChangePasswState extends State<ChangePassw> {
  final passwordController = TextEditingController();
  final oldpasswordController = TextEditingController();
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
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(16)),

              // Second Row
              Text(
                'Create your new password make sure it contains 6 characters, numbers, and special symbols'
                    .tr,
                style: Styles.headLineStyle3,
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(40)),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: oldpasswordController,
                obscureText: passToggle,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Styles.kinp,
                  labelText: 'Old Password'.tr,
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
                    return 'Enter password'.tr;
                  }
                },
              ),

              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: passwordController,
                obscureText: passToggle,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Styles.kinp,
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
                    return 'Enter password'.tr;
                  }
                },
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: confirmPasswordController,
                obscureText: passToggle,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Styles.kinp,
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
              SizedBox(
                width: double.infinity,
                height: GetSize.getScreenHeightDevice(50),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your logic for password validation and navigation
                    showResetPasswordDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.kbtc // primary: Colors.blue,
                      // onPrimary: Colors.white,
                      ),
                  child: Text(
                    'Save'.tr,
                    style: Styles.headLineStyle2,
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
        final ThemeData currentTheme =
            Provider.of<ThemeProvider>(context).theme;
        return Theme(
          data: currentTheme,
          child: AlertDialog(
            backgroundColor: currentTheme
                .colorScheme.background, // Set background color to black
            title: Row(
              children: [
                Icon(
                  Icons.lock,
                  color: currentTheme
                      .colorScheme.onBackground, // Set icon color to blue
                ),
                SizedBox(width: GetSize.getScreenWidthDevice(10)),
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
                child: Text(
                  'OK'.tr,
                  selectionColor: currentTheme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
