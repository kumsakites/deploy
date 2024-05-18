import 'package:flutter/material.dart';
import 'dart:async'; // Import the dart:async library for Timer
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import 'Choose_payment_method.dart';
import 'food_order_page.dart';

class OrderSummary extends StatefulWidget {
  final FoodItem foodItem;

  const OrderSummary({Key? key, required this.foodItem}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  TextEditingController _reviewController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  late Timer _countdownTimer;
  Duration _remainingTime = Duration.zero;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        _startCountdownTimer();
      });
    }
  }

  void _startCountdownTimer() {
    final now = DateTime.now();
    final endTime = DateTime(
        now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    final duration = endTime.difference(now);

    _remainingTime = duration;

    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = duration - Duration(seconds: timer.tick);
      });

      if (_remainingTime.inSeconds <= 0) {
        _countdownTimer.cancel();
        setState(() {
          _remainingTime = Duration.zero;
        });
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Summary".tr,
                style: TextStyle(
                    color: currentTheme.colorScheme.onBackground,
                    fontFamily: 'Roboto',
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: GetSize.getScreenWidthDevice(10)),
              Text(
                '${_remainingTime.inMinutes.toString().padLeft(2, '0')}:${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
                style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(25)),
            child: Column(
              children: [
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: GetSize.getScreenWidthDevice(100),
                              height: GetSize.getScreenHeightDevice(100),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: AssetImage(
                                    widget.foodItem.imagePath,
                                  ))),
                            ),
                            SizedBox(
                              width: GetSize.getScreenWidthDevice(30),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Coming of the robot'.tr,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: currentTheme
                                                .colorScheme.onBackground),
                                      ),
                                      SizedBox(
                                        width: GetSize.getScreenWidthDevice(30),
                                      ),
                                      Text(
                                        "x1",
                                        style: TextStyle(
                                            color: Colors.blue.shade600,
                                            fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: GetSize.getScreenHeightDevice(20)),
                                Text(
                                  "100",
                                  style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: GetSize.getScreenWidthDevice(16)),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                        color: currentTheme.colorScheme.background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () => _selectTime(context),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Icon(Icons.access_time,
                                  color: Colors.blue.shade600, size: 35),
                              SizedBox(width: GetSize.getScreenWidthDevice(20)),
                              Column(
                                children: [
                                  Text(
                                      'Pick up time ${selectedTime.format(context)}'
                                          .tr,
                                      style: TextStyle(
                                          color: currentTheme
                                              .colorScheme.onBackground,
                                          fontSize: 20)),
                                  Text('You need to choose your time'.tr,
                                      style: Styles.headLineStyle3),
                                ],
                              ),
                              SizedBox(width: GetSize.getScreenWidthDevice(20)),
                              Icon(Icons.arrow_forward_ios,
                                  color: currentTheme.colorScheme.onBackground),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: currentTheme.colorScheme.onBackground,
                      // width: 0.5,
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
                              Text('Price Details'.tr,
                                  style: TextStyle(
                                      color:
                                          currentTheme.colorScheme.onBackground,
                                      fontFamily: 'Roboto',
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(16)),
                          Divider(
                            color: currentTheme.colorScheme.onBackground,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Jumbo popcorn(x1)'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('90',
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Service Fee'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('10',
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                            ],
                          ),
                          SizedBox(height: GetSize.getScreenHeightDevice(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Actual Pay'.tr,
                                  style: TextStyle(
                                      color: currentTheme
                                          .colorScheme.onBackground)),
                              Text('100',
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
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Row(
                  children: [
                    Text(
                      'Promo and Vochers'.tr,
                      style: TextStyle(
                          color: currentTheme.colorScheme.onBackground,
                          fontFamily: 'Roboto',
                          fontSize: 21,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                // Add TextField here
                TextField(
                  controller: _reviewController,
                  style: TextStyle(color: Styles.textColor),
                  decoration: InputDecoration(
                    labelText: 'Enter The promo code or voucher'.tr,
                    labelStyle:
                        TextStyle(color: currentTheme.colorScheme.onBackground),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          'Purchase and pick up of food or drinks can only be done on the same day.\n\n'
                              .tr,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: currentTheme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          'If you order food or drinks to watch a movie, we recommend picking it up 10 minutes before the movie starts.'
                              .tr,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: currentTheme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: GetSize.getScreenHeightDevice(30)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentMethod()),
                    );
                  },
                  child: Container(
                    height: GetSize.getScreenHeightDevice(50),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text('Continoue To Payment'.tr,
                            style: TextStyle(
                                color: Styles.textColor, fontSize: 18))),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(30)),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: GetSize.getScreenHeightDevice(50),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Styles.btntwColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text('Cancel Booking'.tr,
                            style: TextStyle(
                                color: Colors.blue[800], fontSize: 18))),
                  ),
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
