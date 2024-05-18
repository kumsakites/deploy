import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import '../utils/getSize.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  String selectedGender = 'Male'.tr;
  bool passToggle = true;

  @override
  void dispose() {
    firstNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    firstNameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    super.dispose();
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
          title: Text(
            'Personal Info'.tr,
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
            child: Column(
              children: [
                SizedBox(height: GetSize.getScreenHeightDevice(100)),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      SizedBox(height: GetSize.getScreenHeightDevice(16)),
                      Container(
                        width: double.infinity,
                        height: GetSize.getScreenHeightDevice(56),
                        child: TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            labelText: 'User Name'.tr,
                            labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: firstNameFocus.hasFocus
                                  ? currentTheme.colorScheme.onBackground
                                  : Styles.kinp,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                            ),
                            filled: true,
                            fillColor: Styles.ktxtf,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: GetSize.getScreenHeightDevice(20),
                              horizontal: GetSize.getScreenWidthDevice(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter User Name'.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: GetSize.getScreenHeightDevice(20)),
                      Container(
                        width: double.infinity,
                        height: GetSize.getScreenHeightDevice(56),
                        child: TextFormField(
                          controller: emailController,
                          focusNode: emailFocus,
                          decoration: InputDecoration(
                            labelText: 'Email'.tr,
                            labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: emailFocus.hasFocus
                                  ? currentTheme.colorScheme.onBackground
                                  : Styles.kinp,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                            ),
                            filled: true,
                            fillColor: Styles.ktxtf,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: GetSize.getScreenHeightDevice(20),
                              horizontal: GetSize.getScreenWidthDevice(15),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
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
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: GetSize.getScreenHeightDevice(20)),
                      Container(
                        height: GetSize.getScreenHeightDevice(56),
                        color: Styles.kinp,
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            // Use the selected phone number
                            print(number.phoneNumber);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          inputDecoration: InputDecoration(
                            labelText: 'Phone Number'.tr,
                            labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: phoneFocus.hasFocus
                                  ? currentTheme.colorScheme.onBackground
                                  : Styles.kinp,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                            ),
                            filled: true,
                            fillColor: Styles.ktxtf,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: GetSize.getScreenHeightDevice(20),
                              horizontal: GetSize.getScreenWidthDevice(15),
                            ),
                          ),
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          textFieldController: phoneController,
                          onInputValidated: (bool value) {
                            // Add your validation logic if needed
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Phone Number'.tr;
                            }
                            return null;
                          },
                          selectorTextStyle: TextStyle(color: Styles.textColor),
                        ),
                      ),
                      SizedBox(height: GetSize.getScreenHeightDevice(20)),
                      Container(
                        height: GetSize.getScreenHeightDevice(56),
                        decoration: BoxDecoration(
                          color: Styles.kinp,
                          borderRadius: BorderRadius.circular(
                              10), // Optional: Add border radius
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 30,
                              color: currentTheme.colorScheme.onBackground,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Gender'.tr,
                              style: Styles.headLineStyle3,
                            ),
                            Spacer(),
                            DropdownButton<String>(
                              value: selectedGender,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedGender = newValue!;
                                });
                              },
                              items: <String>[
                                'Male'.tr,
                                'Female'.tr,
                                'Other'.tr
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              style: TextStyle(
                                color: currentTheme.colorScheme.onBackground,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: GetSize.getScreenHeightDevice(20)),
                      SizedBox(
                        width: double.infinity,
                        height: GetSize.getScreenHeightDevice(50),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your logic for validation and navigation
                            showResetPasswordDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Styles.kbtc // primary: Colors.blue,
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
              ],
            ),
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
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Reset Password Successful'.tr,
                  style: TextStyle(
                    color: Colors.blue,
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
