import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticketing/provider/theme_provider.dart';
import 'package:ticketing/utils/getSize.dart';
import 'package:image_picker/image_picker.dart' as image_picker;
import 'package:provider/provider.dart';
import '../Controllers/Security_page.dart';
import '../Controllers/personal_info.dart';
import '../services/notification.dart';
import '../utils/app_styles.dart';
import '../utils/dark_theme.dart';
import '../utils/light_theme.dart';
import 'Favorite_page.dart';
import 'Interest_page.dart';
import 'about_movie.dart';
import 'help_center.dart';

class ProfileScreen extends StatefulWidget {
  bool isFavorite = false;
  bool isDarkMode = false;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String profileImagePath = ''; // Initialize with an empty string
  late String selectedLanguage = 'English'; // Set a default language

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).theme;
    // ThemeData currentTheme = widget.isDarkMode ?lightTheme  : darkTheme;

    return Scaffold(
      backgroundColor: currentTheme.colorScheme.background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: currentTheme.colorScheme.onBackground,
        ),
        backgroundColor: currentTheme.colorScheme.background,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _pickImage(); // Call method to pick an image
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: profileImagePath.isNotEmpty
                            ? FileImage(File(profileImagePath))
                                as ImageProvider<Object>
                            : AssetImage('images/cenema.png')
                                as ImageProvider<Object>,
                      ),
                    ),
                    SizedBox(width: GetSize.getScreenWidthDevice(20)),
                    Text(
                      'Mark'.tr,
                      style: Styles.headLineStyle3.copyWith(
                          color: currentTheme.colorScheme.onBackground),
                    ),
                  ],
                ),

                // Horizontal Line
                Divider(
                  color: widget.isDarkMode ? Colors.white38 : Colors.black,
                ),

                // Favorites Section
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChoosingCinema()));
                  },
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.isFavorite = !widget.isFavorite;
                          });
                        },
                        child: Icon(
                          widget.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          color: widget.isFavorite
                              ? Colors.red
                              : currentTheme.colorScheme.onBackground,
                        ),
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(20)),
                      Text(
                        'Fav Cinema'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      Spacer(),
                      InkWell(
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: currentTheme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Movie Interest Section
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieInterest()));
                    // Handle movie interest
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.view_comfy_alt,
                        size: 30,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(20)),
                      Text(
                        'Movie Interest'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          // Handle forward arrow
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: currentTheme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Payment Method Section
                Row(
                  children: [
                    Icon(
                      Icons.payment,
                      size: 30,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Payment Method'.tr,
                      style: Styles.headLineStyle3,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // Handle forward arrow
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Generals Section
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'Generals'.tr,
                      style: Styles.headLineStyle3,
                    ),
                    Expanded(
                      child: Divider(
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Personal Info Section
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInfo()));
                  },
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // Handle movie interest
                        },
                        child: Icon(
                          Icons.payment,
                          size: 30,
                          color: currentTheme.colorScheme.onBackground,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Personal info'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonalInfo()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: currentTheme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Notification Section
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 30,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Notification'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NotificationPage())); // Handle forward arrow
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: currentTheme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Security Section
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SecurityPage())); // Handle forward arrow
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.security,
                        size: 30,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Security'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SecurityPage())); // Handle forward arrow
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: currentTheme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Language Section
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Handle movie interest
                      },
                      child: Icon(
                        Icons.language,
                        size: 30,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Language'.tr,
                      style: Styles.headLineStyle3,
                    ),
                    Spacer(),
                    Text(
                      selectedLanguage, // Display the selected language
                      style: TextStyle(
                        fontSize: 16,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Show language dropdown
                        _showLanguageDropdown(context);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Dark Mode Section
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 30,
                      color: currentTheme.colorScheme.onBackground,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Dark mode'.tr,
                      style: Styles.headLineStyle3,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // Handle dark mode toggle
                        setState(() {
                          widget.isDarkMode = !widget.isDarkMode;
                        });
                      },
                      child: Switch(
                        // value: false,
                        value: Provider.of<ThemeProvider>(context).theme ==
                            lightTheme,
                        onChanged: (value) {
                          // Handle dark mode toggle
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        },
                        activeColor: Colors
                            .blue, // Change this to your desired active color
                        inactiveThumbColor: Colors
                            .grey, // Change this to your desired inactive thumb color
                        inactiveTrackColor: Colors.grey
                            .shade300, // Change this to your desired inactive track color
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // About Section
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'About'.tr,
                      style: Styles.headLineStyle3,
                    ),
                    Expanded(
                      child: Divider(
                        color: currentTheme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Help Center Section
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HelpCenter()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.description,
                        size: 30,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Help center'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          // Handle forward arrow
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: currentTheme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // About Us Section
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AboutMovie())); // Handle forward arrow
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        size: 30,
                        color: currentTheme.colorScheme.onBackground,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'About us'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AboutMovie())); // Handle forward arrow
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: currentTheme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),

                // Logout Section
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Handle movie interest
                        // showLogoutDialog(context);
                      },
                      child: Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        showLogoutDialog(context);
                      },
                      child: Text(
                        'Logout'.tr,
                        style: Styles.headLineStyle3,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Logout'.tr,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Styles.kbtc),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Are you sure you want to logout?'.tr,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Styles.bgColor),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                // Implement logout logic here
                Navigator.pop(context); // Close the dialog after logout
              },
              child: Text('Yes Logout'.tr),
            ),
          ],
        );
      },
    );
  }

  // Method to pick an image using ImagePicker
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImagePath = pickedFile.path;
      });
    }
  }

  // Method to show language dropdown
  void _showLanguageDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Language'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLanguage = newValue!;

                    // Ensure the selectedLanguage corresponds to the localization keys
                    if (selectedLanguage == 'English') {
                      Get.updateLocale(Locale("en", "US"));
                    } else if (selectedLanguage == 'Afaan Oromoo') {
                      Get.updateLocale(Locale("om"));
                    } else if (selectedLanguage == 'Amharic') {
                      Get.updateLocale(Locale("am"));
                    } else if (selectedLanguage == 'Tigrigna') {
                      Get.updateLocale(Locale("ti"));
                    }
                  });
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                items: <String>[
                  'Amharic',
                  'Afaan Oromoo',
                  'Tigrigna',
                  'English',
                ].map<DropdownMenuItem<String>>((String value) {
                  // Ensure each value in the items list corresponds to a unique localization key
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}
