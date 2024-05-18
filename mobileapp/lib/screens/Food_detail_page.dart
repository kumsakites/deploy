import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/provider/theme_provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../utils/app_styles.dart';
import 'Order_summary.dart';
import 'food_order_page.dart';

class FoodDetailPage extends StatefulWidget {
  final FoodItem foodItem;

  const FoodDetailPage({Key? key, required this.foodItem}) : super(key: key);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int seatCount = 1; // Define the seatCount variable
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
          title: Text(
            "Order Details".tr,
            style: TextStyle(
                color: currentTheme.colorScheme.onBackground,
                fontFamily: 'Roboto',
                fontSize: 21),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(25)),
            child: Column(
              children: [
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: currentTheme.colorScheme.onBackground,
                      width: GetSize.getScreenWidthDevice(2),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      widget.foodItem.imagePath,
                      width: Get.width,
                      height: Get.height / 3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Jumbo Popcorn",
                            style: TextStyle(
                                color: currentTheme.colorScheme.onBackground,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 30)),
                      ],
                    ),
                    Text(
                      'Indulge in the ultimate movie experience with our movie magic popcorn'
                          .tr,
                      style: Styles.headLineStyle3,
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(30)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: GetSize.getScreenHeightDevice(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              seatCount++;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue.shade600, // Border color
                                width: GetSize.getScreenWidthDevice(
                                    6), // Border width
                              ),
                              shape: BoxShape.circle,
                              color: Styles
                                  .kback, // You can adjust the color as needed
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.add,
                              color: Colors.blue.shade600,
                              size: 35,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(25),
                        ),
                        Text(
                          '$seatCount',
                          style: Styles.headLineStyle1,
                        ),
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(25),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (seatCount > 1) {
                                seatCount--;
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue.shade600, // Border color
                                width: GetSize.getScreenWidthDevice(
                                    6), // Border width
                              ),
                              shape: BoxShape.circle,
                              color: Styles.kback,
                              // You can adjust the color as needed
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.remove,
                                color: Colors.blue.shade600, size: 35),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(30),
                ),
                Text(
                  'Note for your food  or drinks'.tr,
                  style: TextStyle(
                      color: currentTheme.colorScheme.onBackground,
                      fontFamily: 'Roboto',
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(20),
                ),
                TextField(
                  controller: _reviewController,
                  style:
                      TextStyle(color: currentTheme.colorScheme.onBackground),
                  decoration: InputDecoration(
                    labelText: 'Leave notes here'.tr,
                    labelStyle: TextStyle(
                      color: currentTheme.colorScheme
                          .onBackground, // Change this to your desired color
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(30)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodOrderPage()),
                          );
                        },
                        child: Container(
                          height: GetSize.getScreenHeightDevice(40),
                          width: GetSize.getScreenWidthDevice(100),
                          decoration: BoxDecoration(
                            color: Styles.btntwColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text('Cancel'.tr,
                                  style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontSize: 18))),
                        ),
                      ),
                      SizedBox(
                        width: GetSize.getScreenWidthDevice(30),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderSummary(
                                      foodItem: widget.foodItem,
                                    )),
                          );
                        },
                        child: Container(
                          height: GetSize.getScreenHeightDevice(40),
                          width: GetSize.getScreenWidthDevice(150),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text('Add to basket'.tr,
                                  style: TextStyle(
                                      color:
                                          currentTheme.colorScheme.onBackground,
                                      fontSize: 11))),
                        ),
                      ),
                    ],
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
