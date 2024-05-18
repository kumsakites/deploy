import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import '../utils/getSize.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _filterOptions = [
    'Genre'.tr,
    'Language'.tr,
    'Rating'.tr,
    'Release date'.tr,
    'Price'.tr,
    'Duration'.tr,
    'Location'.tr,
    'Age'.tr,
  ];

  List<String> _languageFilters = [
    'Amharic'.tr,
    'Afaan Oromoo'.tr,
    'Tigrigna'.tr,
    'English'.tr,
    'Korean'.tr,
    'French'.tr,
    'Italy'.tr,
    'Arabic'.tr,
  ];

  List<String> _trendingFilters = [
    'Animation'.tr,
    'Price'.tr,
    'Comedy'.tr,
    'Release date'.tr,
    'Thriller'.tr,
    'Language'.tr,
    'Romance'.tr,
    'Location'.tr,
  ];

  List<String> _GenreFilters = [
    'Animation'.tr,
    'Action'.tr,
    'Comedy'.tr,
    'Sci-fi'.tr,
    'Thriller'.tr,
    'Adventure'.tr,
    'Romance'.tr,
    'Family'.tr,
  ];

  List<bool> _isSelectedFilter = List.filled(8, false);
  List<bool> _isSelectedLanguage = List.filled(8, false);

  String _selectedFilter = ''; // Store the selected filter
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int seatCount = 1;

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return WillPopScope(
      onWillPop: () async {
        if (_selectedFilter == 'Location'.tr) {
          setState(() {
            _selectedFilter = '';
          });
          return false;
        } else {
          return true;
        }
      },
      child: Theme(
        data: currentTheme,
        child: Scaffold(
          backgroundColor: currentTheme.colorScheme.background,
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                if (_selectedFilter == 'Location'.tr) {
                  setState(() {
                    _selectedFilter = '';
                  });
                } else {
                  Navigator.pop(context);
                }
              },
              color: currentTheme.colorScheme.onBackground,
            ),
            backgroundColor: currentTheme.colorScheme.background,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: _buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    if (_selectedFilter == 'Location'.tr) {
      return Theme(
        data: currentTheme,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenWidthDevice(15)),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: currentTheme.colorScheme.background,
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                  color: Color.fromRGBO(204, 212, 225, 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  style:
                      TextStyle(color: currentTheme.colorScheme.onBackground),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    //filled: true,
                    //fillColor: Colors.white70,
                    hintText: 'enter location'.tr,
                    labelStyle:
                        TextStyle(color: currentTheme.colorScheme.onBackground),
                    hintStyle: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                    ),
                    prefixIcon: Icon(Icons.search,
                        color: currentTheme.colorScheme.onBackground),
                  ),
                ),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              Text(
                'Location'.tr,
                style: Styles.headLineStyle3,
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(10)),
              Text(
                'Nearby Theatre'.tr,
                style: Styles.headLineStyle3,
              ),
              Divider(
                color: currentTheme.colorScheme.onBackground,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date:'.tr,
                    style:
                        TextStyle(color: currentTheme.colorScheme.onBackground),
                  ),
                  SizedBox(width: GetSize.getScreenWidthDevice(10)),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Row(
                      children: [
                        Text(
                          '${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground),
                        ),
                        SizedBox(width: GetSize.getScreenWidthDevice(5)),
                        Icon(Icons.date_range,
                            color: currentTheme.colorScheme.onBackground),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(10)),
              Divider(
                color: currentTheme.colorScheme.onBackground,
              ),
              Row(
                children: [
                  SizedBox(width: GetSize.getScreenWidthDevice(10)),
                  Row(
                    children: [
                      Text(
                        'Genre'.tr, // Replace with your actual genre text
                        style: TextStyle(
                            color: currentTheme.colorScheme.onBackground),
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(10)),
                      Icon(Icons.add,
                          color: currentTheme
                              .colorScheme.onBackground), // Plus icon
                    ],
                  ),
                ],
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(10)),
              Divider(
                color: currentTheme.colorScheme.onBackground,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time:'.tr,
                    style:
                        TextStyle(color: currentTheme.colorScheme.onBackground),
                  ),
                  SizedBox(width: GetSize.getScreenWidthDevice(10)),
                  GestureDetector(
                    onTap: () => _selectTime(context),
                    child: Row(
                      children: [
                        Text(
                          _selectedTime.format(context),
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground),
                        ),
                        SizedBox(width: GetSize.getScreenWidthDevice(5)),
                        Icon(Icons.access_time,
                            color: currentTheme.colorScheme.onBackground),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(10)),
              Divider(
                color: currentTheme.colorScheme.onBackground,
              ),

              // Add Seat Count Section
              SizedBox(height: GetSize.getScreenHeightDevice(10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Seats'.tr,
                        style: TextStyle(
                            color: currentTheme.colorScheme.onBackground),
                      ),
                    ],
                  ),
                  SizedBox(height: GetSize.getScreenHeightDevice(10)),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            // Handle decrement logic
                            // Make sure the seat count is always positive
                            if (seatCount > 1) {
                              seatCount--;
                            }
                          });
                        },
                        child: Icon(Icons.remove,
                            color: currentTheme.colorScheme.onBackground),
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(10)),
                      Text(
                        "Seats".tr,
                        style: TextStyle(
                            color: currentTheme.colorScheme.onBackground),
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(10)),
                      Text(
                        '$seatCount', // Display seat count
                        style: TextStyle(
                            color: currentTheme.colorScheme.onBackground),
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(10)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            // Handle increment logic
                            seatCount++;
                          });
                        },
                        child: Icon(Icons.add,
                            color: currentTheme.colorScheme.onBackground),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: currentTheme.colorScheme.onBackground,
              ),
              SizedBox(
                height: GetSize.getScreenHeightDevice(40),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPassword()));
                  },
                  style: ElevatedButton.styleFrom(
                      // primary: Colors.blue,
                      backgroundColor: Styles.kbtc // onPrimary: Colors.white,
                      ),
                  child: Text(
                    'Search A movie'.tr,
                    style:
                        TextStyle(color: currentTheme.colorScheme.onBackground),
                  ),
                ),
              ),
              SizedBox(
                height: GetSize.getScreenHeightDevice(40),
              ),
            ],
          ),
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(15)),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: currentTheme.colorScheme.background,
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
              color: Color.fromRGBO(204, 212, 225, 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              style: TextStyle(color: currentTheme.colorScheme.onBackground),
              decoration: InputDecoration(
                border: InputBorder.none,
                //filled: true,
                //fillColor: Colors.white70,
                hintText: 'enter movie'.tr,
                labelStyle:
                    TextStyle(color: currentTheme.colorScheme.onBackground),
                hintStyle: TextStyle(
                  color: currentTheme.colorScheme.onBackground,
                ),
                prefixIcon: Icon(Icons.search,
                    color: currentTheme.colorScheme.onBackground),
              ),
            ),
          ),
          SizedBox(height: GetSize.getScreenHeightDevice(20)),
          Text(
            'Filter by',
            style: Styles.headLineStyle3,
          ),
          SizedBox(height: GetSize.getScreenHeightDevice(10)),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(
              _filterOptions.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    if (_filterOptions[index] == 'Language'.tr) {
                      _isSelectedLanguage[index] = !_isSelectedLanguage[index];
                      _trendingFilters = _isSelectedLanguage[index]
                          ? _languageFilters
                          : _filterOptions;
                    } else if (_filterOptions[index] == 'Genre'.tr) {
                      _isSelectedFilter[index] = !_isSelectedFilter[index];
                      _trendingFilters = _isSelectedFilter[index]
                          ? _GenreFilters
                          : _filterOptions;
                    } else {
                      _isSelectedFilter[index] = !_isSelectedFilter[index];

                      int selectedCount = _isSelectedFilter
                          .where((isSelected) => isSelected)
                          .length;

                      if (_isSelectedFilter[index] && selectedCount > 3) {
                        _isSelectedFilter[index] = false;
                      }

                      _selectedFilter =
                          _isSelectedFilter[index] ? _filterOptions[index] : '';
                    }
                  });
                },
                child: SizedBox(
                  height: GetSize.getScreenHeightDevice(50),
                  child: FilterChip(
                    label: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        _filterOptions[index],
                        overflow: TextOverflow.ellipsis,
                        //selectionColor: Colors.red,
                        style: TextStyle(
                            color: currentTheme.colorScheme.onBackground),
                      ),
                    ),
                    selected: _filterOptions[index] == 'Language'.tr
                        ? _isSelectedLanguage[index]
                        : _isSelectedFilter[index],
                    selectedColor: Colors.blue,
                    backgroundColor: Color.fromRGBO(66, 133, 244, 0.2),
                    showCheckmark: false,
                    onSelected: (bool value) {
                      setState(() {
                        if (_filterOptions[index] == 'Language'.tr) {
                          _isSelectedLanguage[index] = value;
                          _trendingFilters =
                              value ? _languageFilters : _filterOptions;
                        } else if (_filterOptions[index] == 'Genre'.tr) {
                          _isSelectedFilter[index] = value;
                          _trendingFilters =
                              value ? _GenreFilters : _filterOptions;
                        } else {
                          _isSelectedFilter[index] = value;

                          int selectedCount = _isSelectedFilter
                              .where((isSelected) => isSelected)
                              .length;

                          if (_isSelectedFilter[index] && selectedCount > 3) {
                            _isSelectedFilter[index] = false;
                          }

                          _selectedFilter = _isSelectedFilter[index]
                              ? _filterOptions[index]
                              : '';
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: GetSize.getScreenHeightDevice(10)),
          Text(
            'Trending filters',
            style: Styles.headLineStyle3,
          ),
          SizedBox(height: GetSize.getScreenHeightDevice(10)),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              _trendingFilters.length,
              (index) => InkWell(
                onTap: () {
                  // TODO: Add functionality for selecting trending filters
                },
                child: FilterChip(
                  label: Text(
                    _trendingFilters[index],
                    style:
                        TextStyle(color: currentTheme.colorScheme.onBackground),
                  ),
                  onSelected: (bool value) {},
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
