import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import '../utils/getSize.dart';
import 'Generate_New_password.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late FocusNode _firstDigitFocusNode;
  late FocusNode _secondDigitFocusNode;
  late FocusNode _thirdDigitFocusNode;
  late FocusNode _fourthDigitFocusNode;

  late List<TextEditingController> _controllers;
  int _currentFocusedIndex = 3; // Initialize with the last index

  @override
  void initState() {
    super.initState();
    _firstDigitFocusNode = FocusNode();
    _secondDigitFocusNode = FocusNode();
    _thirdDigitFocusNode = FocusNode();
    _fourthDigitFocusNode = FocusNode();

    _controllers = List.generate(
      4,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    _firstDigitFocusNode.dispose();
    _secondDigitFocusNode.dispose();
    _thirdDigitFocusNode.dispose();
    _fourthDigitFocusNode.dispose();

    _controllers.forEach((controller) {
      controller.dispose();
    });

    super.dispose();
  }

  void _handleDeletion() {
    if (_currentFocusedIndex >= 0) {
      _controllers[_currentFocusedIndex].clear();
      FocusScope.of(context).requestFocus(_getFocusNode(_currentFocusedIndex));
      _currentFocusedIndex--;
    }
  }

  Color _getBorderColor(int index) {
    FocusNode focusNode = _getFocusNode(index);
    return focusNode.hasFocus ? Colors.blue : Color(0xFF0000FF);
  }

  FocusNode _getFocusNode(int index) {
    switch (index) {
      case 0:
        return _firstDigitFocusNode;
      case 1:
        return _secondDigitFocusNode;
      case 2:
        return _thirdDigitFocusNode;
      case 3:
        return _fourthDigitFocusNode;
      default:
        throw Exception("Invalid index".tr);
    }
  }

  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return Theme(
      data: currentTheme,
      child: Scaffold(
        backgroundColor: currentTheme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: currentTheme.colorScheme.background,
          iconTheme: IconThemeData(
            color: currentTheme.colorScheme
                .onBackground, // Change the color of the back button to white
          ),
        ),
        body: RawKeyboardListener(
          focusNode: FocusNode(),
          onKey: (RawKeyEvent event) {
            if (event is RawKeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.backspace ||
                  event.logicalKey == LogicalKeyboardKey.delete) {
                // Handle backspace or delete key press
                _handleDeletion();
              }
            }
          },
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: GetSize.getScreenWidthDevice(20)),
                    child: Row(
                      children: [
                        Text('OTP Code Verification'.tr,
                            style: TextStyle(
                                color: currentTheme.colorScheme.onBackground,
                                fontFamily: 'Roboto',
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(16)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: GetSize.getScreenWidthDevice(15)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                              'We have sent an OTP code to your email mar********ley@yourdomain.com Enter the OTP code below to verify'
                                  .tr,
                              style: Styles.headLineStyle3),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Container(
                          width: GetSize.getScreenWidthDevice(50),
                          height: GetSize.getScreenHeightDevice(50),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _getBorderColor(i),
                            ),
                            color: currentTheme.colorScheme.background,
                          ),
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: _controllers[i],
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            focusNode: _getFocusNode(i),
                            onChanged: (value) {
                              if (value.isNotEmpty && i < 3) {
                                FocusScope.of(context)
                                    .requestFocus(_getFocusNode(i + 1));
                                _currentFocusedIndex =
                                    i + 1; // Update the current focused index
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: GetSize.getScreenHeightDevice(20),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                              },
                              child: Center(
                                child: Text(
                                  'Didn\'t receive email?'.tr,
                                  style: Styles.headLineStyle3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: GetSize.getScreenHeightDevice(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the content horizontally
                          children: [
                            Text("You can resend code in".tr,
                                style: Styles.headLineStyle3),
                            Text(
                              " 40 ",
                              style: TextStyle(
                                  color: Styles.btntColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text("s".tr, style: Styles.headLineStyle3),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(16)),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: GetSize.getScreenWidthDevice(15)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewPassword()));
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
                                color: currentTheme.colorScheme.onBackground),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
