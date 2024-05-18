import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';
import '../utils/app_styles.dart';
import 'Add_payment.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedPaymentMethodIndex = -1;

  List<PaymentMethodItem> paymentMethods = [
    PaymentMethodItem("Connected".tr, "images/visa.png"),
    PaymentMethodItem("Connected".tr, "images/paypal.png"),
    PaymentMethodItem("Connected".tr, "images/discover.png"),
    PaymentMethodItem("Connected".tr, "images/mastercard.png"),
    PaymentMethodItem("Connected".tr, "images/googlepay.png"),
    PaymentMethodItem("Connected".tr, "images/applepay.png"),
  ];

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
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  "Choose Payment Method".tr,
                  style: Styles.headLineStyle3,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenHeightDevice(20)),
            child: Column(
              children: [
                for (int index = 0; index < paymentMethods.length; index++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPaymentMethodIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: selectedPaymentMethodIndex == index
                            ? Colors.blue.withOpacity(0.1)
                            : currentTheme.colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: currentTheme.colorScheme
                              .onBackground, // Set the border color to white
                          width: 1.0, // Set the border width (adjust as needed)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                paymentMethods[index].imagePath,
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(width: 16.0),
                            ],
                          ),
                          Expanded(
                            child: Text(
                              paymentMethods[index].name,
                              style: TextStyle(
                                  color: currentTheme.colorScheme.background,
                                  fontFamily: 'Roboto',
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          if (selectedPaymentMethodIndex == index)
                            Icon(Icons.check_circle, color: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedPaymentMethodIndex != -1) {
                        // TODO: Add navigation to the next page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPayment()));
                      } else {
                        // Show a message or dialog indicating that a method must be selected
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Select Payment Method".tr,
                                style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground),
                              ),
                              content: Text(
                                "Please select a payment method before proceeding."
                                    .tr,
                                style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "OK".tr,
                                    style: TextStyle(
                                        color: currentTheme
                                            .colorScheme.onBackground),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade100),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Styles.btntColor,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add New Payment".tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(30)),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Confirm Payment".tr,
                            style: TextStyle(
                                color: currentTheme.colorScheme.onBackground),
                          ),
                          content: Text(
                            "Are you sure you want to confirm the payment of \$680.00?"
                                .tr,
                            style: TextStyle(
                                color: currentTheme.colorScheme.onBackground),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text(
                                "Cancel".tr,
                                style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: Add logic for confirming payment
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text(
                                "Confirm".tr,
                                style: TextStyle(
                                    color:
                                        currentTheme.colorScheme.onBackground),
                              ),
                            ),
                          ],
                        );
                      },
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
                      child: Text('Confirm Payment-\$680.00'.tr,
                          style: TextStyle(
                              color: currentTheme.colorScheme.onBackground,
                              fontSize: 18)),
                    ),
                  ),
                ),
                SizedBox(height: GetSize.getScreenHeightDevice(60)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentMethodItem {
  final String name;
  final String imagePath;

  PaymentMethodItem(this.name, this.imagePath);
}
