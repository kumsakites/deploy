import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';
import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import 'where_u_w_to_go.dart';

void main() {
  runApp(SignUpPage());
}

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FocusNode firstNameFocus = FocusNode();
  bool passToggle = true;
  bool isChecked = false;
  bool isChecked1 = false;
  bool _isNotValidate = false;

  void registerUser() async {
    if (_formKey.currentState!.validate()) {
      // User data to be sent to the server
      Map<String, dynamic> userData = {
        'username': firstNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      };

      try {
        final response = await http.post(
          Uri.parse(
              'http://192.168.61.226:5001/register'), // Replace with your actual server URL
          body: jsonEncode(userData), // Convert the map to a JSON string
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 201) {
          // Successful registration
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Successfully registered'.tr),
                content: Text('You can now proceed to the next page.'.tr),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WhereYouWntGo()),
                      );
                    },
                    child: Text('Continue'.tr),
                  ),
                ],
              );
            },
          );
        } else {
          // Registration failed, handle the error
          print('Registration failed: ${response.body}');
          // You can display an error message or perform other actions based on the response
        }
      } catch (error) {
        // Handle other errors, e.g., network issues
        print('Error during registration: $error');
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    firstNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Theme(
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
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(20),
                vertical: GetSize.getScreenHeightDevice(20)),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('images/signup.jpg'),
                    radius: 100.0,
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(60)),
                  Container(
                    width: double.infinity,
                    height: GetSize.getScreenHeightDevice(56),
                    //margin: EdgeInsets.only(left: 20, right: 20),
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
                          vertical: GetSize.getScreenHeightDevice(
                              20), // Adjust the height as needed
                          horizontal: GetSize.getScreenWidthDevice(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter User Name'.tr;
                        }
                        // Additional validation if needed
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(20)),
                  Container(
                    width: double.infinity,
                    height: GetSize.getScreenHeightDevice(56),
                    // margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email'.tr,
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
                        prefixIcon: const Icon(Icons.email),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: GetSize.getScreenHeightDevice(
                              20), // Adjust the height as needed
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
                    width: double.infinity,
                    height: GetSize.getScreenHeightDevice(56),
                    //margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        labelText: 'Password'.tr,
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: firstNameFocus.hasFocus
                              ? Colors.white
                              : Styles.kinp,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                        ),
                        filled: true,
                        fillColor: Styles.ktxtf,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: GetSize.getScreenHeightDevice(
                              20), // Adjust the height as needed
                          horizontal: GetSize.getScreenWidthDevice(15),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password'.tr;
                        }
                        // Additional validation if needed
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(20)),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(10)),
                      Text(
                        'Remember me'.tr,
                        style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(10)),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: isChecked1,
                        onChanged: (value) {
                          setState(() {
                            isChecked1 = value!;
                          });
                        },
                      ),
                      Text(
                        "I want to receive email".tr,
                        style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(20)),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: GestureDetector(
                      onTap: registerUser,
                      child: Container(
                        width: double.infinity,
                        height: GetSize.getScreenHeightDevice(52),
                        //margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.symmetric(
                          horizontal: GetSize.getScreenWidthDevice(15),
                          vertical: GetSize.getScreenHeightDevice(15),
                        ),
                        decoration: BoxDecoration(
                          color: Styles.kbtc,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up'.tr,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: currentTheme.colorScheme.onBackground,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(60)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
