// MovieInterest.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/provider/theme_provider.dart';
import '../utils/app_styles.dart';
import '../utils/getSize.dart';

import 'Selected_itemPage.dart'; // Import the SelectedItemPage

class MovieInterest extends StatefulWidget {
  const MovieInterest({Key? key}) : super(key: key);

  @override
  State<MovieInterest> createState() => _MovieInterestState();
}

class _MovieInterestState extends State<MovieInterest> {
  List<String> _MovieOptions = [
    'Romance'.tr,
    'Language'.tr,
    'Mystery'.tr,
    'Science Fiction'.tr,
    'Fantasy'.tr,
    'Thriller'.tr,
    'Action'.tr,
    'Horror'.tr,
    'Crime'.tr,
    'Western'.tr,
    'Sports'.tr,
    'Comedy'.tr,
    'Adventure'.tr,
    'Musical'.tr,
    'Historical'.tr,
    'Travel'.tr,
    'Biographical'.tr,
    'Psychological'.tr,
    'Family'.tr,
    'Supernatural'.tr,
    'Zombie'.tr,
    'Documentary'.tr,
    'Animation'.tr,
    'Drama'.tr,
    'Martial Arts'.tr,
    'War'.tr,
  ];

  List<bool> _isSelected = List.filled(26, false);

  @override
  void initState() {
    super.initState();
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
            'Movie Interest'.tr,
            style: TextStyle(
              color: currentTheme.colorScheme.onBackground,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    _MovieOptions.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          _isSelected[index] = !_isSelected[index];
                        });
                      },
                      child: FilterChip(
                        label: Text(
                          _MovieOptions[index],
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground),
                        ),
                        selected: _isSelected[index],
                        selectedColor: Colors.blue,
                        backgroundColor: Color.fromRGBO(66, 133, 244, 0.2),
                        showCheckmark: false,
                        onSelected: (bool value) {
                          setState(() {
                            _isSelected[index] = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                SizedBox(
                  width: double.infinity,
                  height: GetSize.getScreenHeightDevice(50),
                  child: ElevatedButton(
                    onPressed: () {
                      // Check if Action or Comedy is selected
                      bool isActionSelected =
                          _isSelected[_MovieOptions.indexOf('Action'.tr)];
                      bool isComedySelected =
                          _isSelected[_MovieOptions.indexOf('Comedy'.tr)];

                      // Navigate to SelectedItemPage if Action or Comedy is selected
                      if (isActionSelected || isComedySelected) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedItemPage(
                              isActionSelected: isActionSelected,
                              isComedySelected: isComedySelected,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.kbtc,
                    ),
                    child: Text(
                      'Save'.tr,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: currentTheme.colorScheme.onBackground),
                    ),
                  ),
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
