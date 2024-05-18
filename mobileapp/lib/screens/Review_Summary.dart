import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/app_styles.dart';
import 'package:ticketing/utils/getSize.dart';

import '../Controllers/choose_seat.dart';
import '../provider/theme_provider.dart';
import 'watch_movie_page.dart';

class ReviewSummary extends StatefulWidget {
  final String imageUrl;
  final Image imageWidget;
  const ReviewSummary(
      {Key? key, required this.imageUrl, required this.imageWidget})
      : super(key: key);

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  TextEditingController _reviewController = TextEditingController();

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
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Review Summary".tr,
              style: TextStyle(
                  color: currentTheme.colorScheme.onBackground,
                  fontFamily: 'Roboto',
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenWidthDevice(30)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Card(
                        child: Container(
                            height: GetSize.getScreenHeightDevice(150),
                            width: GetSize.getScreenWidthDevice(100),
                            child: widget.imageWidget),
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(16)),
                      Card(
                        elevation: 5.0,
                        child: Container(
                          color: currentTheme.colorScheme.background,
                          padding: EdgeInsets.all(16.0),
                          width: GetSize.getScreenWidthDevice(200),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Coming of the Robot'.tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: currentTheme
                                            .colorScheme.onBackground,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: GetSize.getScreenHeightDevice(16)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Duration'.tr,
                                      style: TextStyle(
                                          color: currentTheme
                                              .colorScheme.onBackground)),
                                  Text('128 minutes'.tr,
                                      style: TextStyle(
                                          color: currentTheme
                                              .colorScheme.onBackground)),
                                ],
                              ),
                              SizedBox(
                                  height: GetSize.getScreenHeightDevice(8)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Director'.tr,
                                      style: TextStyle(
                                          color: currentTheme
                                              .colorScheme.onBackground)),
                                  Text('Nahome'.tr,
                                      style: TextStyle(
                                          color: currentTheme
                                              .colorScheme.onBackground)),
                                ],
                              ),
                              SizedBox(
                                  height: GetSize.getScreenHeightDevice(8)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('AR'.tr,
                                      style: TextStyle(
                                          color: currentTheme
                                              .colorScheme.onBackground)),
                                  Text('R17+'.tr,
                                      style: TextStyle(
                                          color: currentTheme
                                              .colorScheme.onBackground)),
                                ],
                              ),
                              SizedBox(
                                  height: GetSize.getScreenHeightDevice(8)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Genre'.tr,
                                      style: TextStyle(
                                          color: currentTheme
                                              .colorScheme.onBackground)),
                                  Text('Comedy'.tr,
                                      style: TextStyle(
                                          color: currentTheme
                                              .colorScheme.onBackground)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(40)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenHeightDevice(25)),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Styles.btntColor,
                      width: GetSize.getScreenWidthDevice(2),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      color: currentTheme.colorScheme.background,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Booking Details'.tr,
                                  style: TextStyle(
                                      color:
                                          currentTheme.colorScheme.onBackground,
                                      fontFamily: 'Roboto',
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(16)),
                          Divider(
                            color: currentTheme.colorScheme.onBackground,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Cinema'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('AMC Emp 25'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Package'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('Standart'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Auditorium'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('Auditorium 3'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('Feb 28, 2024'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Hours'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('17:30 - 20:40',
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Seat(s)'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('F7',
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(40)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenHeightDevice(25)),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Styles.btntColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      color: currentTheme.colorScheme.background,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Price Details'.tr,
                                  style: TextStyle(
                                      color:
                                          currentTheme.colorScheme.onBackground,
                                      fontFamily: 'Roboto',
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(16)),
                          Divider(
                            color: currentTheme.colorScheme.onBackground,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Cinema'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('500',
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Auditorium'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('2',
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('502',
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: GetSize.getScreenHeightDevice(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: GetSize.getScreenWidthDevice(25),
                ),
                child: Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Promo and Vouchers'.tr,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: currentTheme.colorScheme.onBackground),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: GetSize.getScreenHeightDevice(20)),
              // Add TextField here
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenWidthDevice(25)),
                child: TextField(
                  controller: _reviewController,
                  style:
                      TextStyle(color: currentTheme.colorScheme.onBackground),
                  decoration: InputDecoration(
                    labelText: 'Enter The promo code or voucher'.tr,
                    labelStyle:
                        TextStyle(color: currentTheme.colorScheme.onBackground),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(30)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenWidthDevice(25)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseSeat()),
                    );
                  },
                  child: Container(
                    height: GetSize.getScreenHeightDevice(40),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Styles.kbtc,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Continue To Payment'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: GetSize.getScreenHeightDevice(30)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: GetSize.getScreenWidthDevice(25)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: GetSize.getScreenHeightDevice(40),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Styles.kbtnw,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Cancel Booking'.tr,
                          style:
                              TextStyle(color: Colors.blue[800], fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: GetSize.getScreenHeightDevice(60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String label;
  final String value;

  RowText(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label + ':'),
        SizedBox(width: GetSize.getScreenWidthDevice(8)),
        Text(value),
      ],
    );
  }
}
