import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({super.key});

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  final GlobalKey qrKey =
      GlobalKey(debugLabel: 'QR'); // Key for QR code scanner
  TextEditingController _reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return Theme(
      data: currentTheme,
      child: Scaffold(
        backgroundColor: currentTheme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: currentTheme.colorScheme.background,
          leading: IconButton(
            icon: Icon(Icons.cancel,
                color: currentTheme.colorScheme.onBackground),
            onPressed: () {
              Navigator.pop(
                  context); // Pop the current screen on cancel icon press
            },
          ),
          title: Text('Add Payment'.tr,
              style: TextStyle(color: currentTheme.colorScheme.onBackground)),
          actions: [
            IconButton(
              icon: Icon(Icons.qr_code,
                  color: currentTheme.colorScheme.onBackground),
              onPressed: () {
                _startQRScanner(
                    context); // Start QR code scanner on QR icon press
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(20)),
            child: Column(
              children: [
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                Row(
                  children: [
                    Text(
                      'Card Number'.tr,
                      style: Styles.headLineStyle3,
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                // Add TextField here
                TextField(
                  controller: _reviewController,
                  style:
                      TextStyle(color: currentTheme.colorScheme.onBackground),
                  decoration: InputDecoration(
                    labelText: '2640 4763 7569 8456'.tr,
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
                    Text(
                      'Account Holder Name'.tr,
                      style: Styles.headLineStyle3,
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                // Add TextField here
                TextField(
                  controller: _reviewController,
                  style:
                      TextStyle(color: currentTheme.colorScheme.onBackground),
                  decoration: InputDecoration(
                    labelText: 'Beth Abraham'.tr,
                    labelStyle:
                        TextStyle(color: currentTheme.colorScheme.onBackground),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Expire Date'.tr,
                      style: Styles.headLineStyle3,
                    ),
                    Text(
                      'CVV'.tr,
                      style: Styles.headLineStyle3,
                    ),
                  ],
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 180,
                        child: TextField(
                          controller: _reviewController,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground),
                          decoration: InputDecoration(
                            labelText: 'Beth Abraham'.tr,
                            labelStyle: TextStyle(
                                color: currentTheme.colorScheme.onBackground),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 120,
                        child: TextField(
                          controller: _reviewController,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground),
                          decoration: InputDecoration(
                            labelText: '475'.tr,
                            labelStyle: TextStyle(
                                color: currentTheme.colorScheme.onBackground),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(40)),
                Divider(
                  color: currentTheme.colorScheme.onBackground,
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: GetSize.getScreenWidthDevice(20)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(20),
                        ),
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(20),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Center(
                            child: ClipOval(
                              child: Image.asset(
                                'images/paypal.png', // Replace with your first image asset
                                width: GetSize.getScreenWidthDevice(50),
                                height: GetSize.getScreenHeightDevice(50),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: GetSize.getScreenWidthDevice(20)),
                        InkWell(
                          onTap: () {},
                          splashColor: Styles.kakiColor,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Ink.image(
                                  image: AssetImage('images/vis.png'),
                                  height: GetSize.getScreenHeightDevice(35),
                                  width: GetSize.getScreenWidthDevice(35),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: GetSize.getScreenWidthDevice(20)),
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(20),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Center(
                            child: ClipOval(
                              child: Image.asset(
                                'images/discover.png', // Replace with your first image asset
                                width: GetSize.getScreenWidthDevice(50),
                                height: GetSize.getScreenHeightDevice(50),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: GetSize.getScreenWidthDevice(20)),
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(20),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Center(
                            child: ClipOval(
                              child: Image.asset(
                                'images/mastercard.png', // Replace with your first image asset
                                width: GetSize.getScreenWidthDevice(50),
                                height: GetSize.getScreenHeightDevice(50),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: GetSize.getScreenWidthDevice(20)),
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(20),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Center(
                            child: ClipOval(
                              child: Image.asset(
                                'images/googlepay.png', // Replace with your first image asset
                                width: GetSize.getScreenWidthDevice(50),
                                height: GetSize.getScreenHeightDevice(50),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: GetSize.getScreenWidthDevice(20),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Center(
                            child: ClipOval(
                              child: Image.asset(
                                'images/applepay.png', // Replace with your first image asset
                                width: GetSize.getScreenWidthDevice(50),
                                height: GetSize.getScreenHeightDevice(50),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Add more genres as needed
                      ],
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(120)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to start the QR code scanner
  void _startQRScanner(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QRView(
          key: qrKey,
          onQRViewCreated: (QRViewController controller) {
            // Set up QR code scanner controller
            controller.scannedDataStream.listen((scanData) {
              // Handle the scanned QR code data
              print('Scanned data: $scanData');
              Navigator.pop(context); // Pop the QR code scanner screen
            });
          },
        ),
      ),
    );
  }
}
