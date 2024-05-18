import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ticketing/utils/getSize.dart';

import '../provider/theme_provider.dart';
import '../screens/food_order_page.dart';
import '../utils/app_styles.dart';

class ChooseSeat extends StatefulWidget {
  const ChooseSeat({Key? key}) : super(key: key);

  @override
  State<ChooseSeat> createState() => _ChooseSeatState();
}

class _ChooseSeatState extends State<ChooseSeat> {
  List<String> items = [
    'A1',
    'A2',
    'A3',
    'A4',
    'A5',
    'A6',
    'A7',
    'A8',
    'A9',
    'A10',
    'B1',
    'B2',
    'B3',
    'B4',
    'B5',
    'A11',
    'A12',
    'A13',
    'A14',
    'A15',
    'C1',
    'C2',
    'C3',
    'C4',
    'C5',
    'A16',
    'A17',
    'A18',
    'A19',
    'A20',
    'D1',
    'D2',
    'D3',
    'D4',
    'D5',
    'A21',
    'A22',
    'A23',
    'A24',
    'A25',
    'E1',
    'E2',
    'E3',
    'E4',
    'E5',
    'A26',
    'A27',
    'A28',
    'A29',
    'A30',
    'F1',
    'D6',
    'D7',
    'D8',
    'D9',
    'A31',
    'A32',
    'A33',
    'A34',
    'G1',
    'A35',
    'A36',
    'A37',
    'A38',
    'A39',
    'H1',
    'H2',
    'H3',
    'H4',
    'H5',
    'A40',
    'A41',
    'A42',
    'A43',
    'A44',
  ];

  Map<String, bool> selectedItems = {};
  List<String> selectedSeatsList = []; // Track the selected seats

  @override
  void initState() {
    super.initState();
    items.forEach((item) {
      selectedItems[item] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
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
            "Choose Seats".tr,
            style: TextStyle(
                color: currentTheme.colorScheme.onBackground,
                fontFamily: 'Roboto',
                fontSize: 21,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GetSize.getScreenWidthDevice(25)),
            child: Column(
              children: [
                SizedBox(height: GetSize.getScreenHeightDevice(40)),
                SizedBox(
                  height: GetSize.getScreenHeightDevice(350),
                  child: SelectableGrid(
                      items: items,
                      selectedItems: selectedItems,
                      updateSelectedSeats: _updateSelectedSeats),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: GetSize.getScreenWidthDevice(20),
                        height: GetSize.getScreenHeightDevice(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: currentTheme.colorScheme.onBackground,
                          ),
                        ),
                        child: Checkbox(
                          value: selectedItems['Checkbox1'] ?? false,
                          onChanged: (value) {
                            setState(() {
                              selectedItems['Checkbox1'] = value ?? false;
                            });
                          },
                          activeColor:
                              Colors.blue, // Set the color when checked
                          checkColor: currentTheme.colorScheme.onBackground,

                          // Set the check color when checked
                        ),
                      ),
                      SizedBox(
                        width: GetSize.getScreenWidthDevice(5),
                      ),
                      Text(
                        'Available'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      SizedBox(
                        width: GetSize.getScreenWidthDevice(10),
                      ),
                      Container(
                        width: GetSize.getScreenWidthDevice(20),
                        height: GetSize.getScreenHeightDevice(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: currentTheme.colorScheme.onBackground,
                          ),
                        ),
                        child: Checkbox(
                          value: selectedItems['Checkbox2'] ?? false,
                          onChanged: (value) {
                            setState(() {
                              selectedItems['Checkbox2'] = value ?? false;
                            });
                          },
                          activeColor:
                              Colors.blue, // Set the color when checked
                          checkColor: currentTheme.colorScheme
                              .onBackground, // Set the check color when checked
                        ),
                      ),
                      SizedBox(
                        width: GetSize.getScreenWidthDevice(5),
                      ),
                      Text(
                        'Token'.tr,
                        style: Styles.headLineStyle3,
                      ),
                      SizedBox(
                        width: GetSize.getScreenWidthDevice(10),
                      ),
                      Container(
                        width: GetSize.getScreenWidthDevice(20),
                        height: GetSize.getScreenHeightDevice(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: currentTheme.colorScheme.onBackground,
                          ),
                        ),
                        child: Checkbox(
                          value: selectedItems['Checkbox3'] ?? false,
                          onChanged: (value) {
                            setState(() {
                              selectedItems['Checkbox3'] = value ?? false;
                            });
                          },
                          activeColor:
                              Colors.blue, // Set the color when checked
                          checkColor: currentTheme.colorScheme
                              .onBackground, // Set the check color when checked
                        ),
                      ),
                      SizedBox(
                        width: GetSize.getScreenWidthDevice(5),
                      ),
                      Text(
                        'Selected'.tr,
                        style: Styles.headLineStyle3,
                      ),
                    ],
                  ),
                ),
                Divider(color: currentTheme.colorScheme.onBackground),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Total Price'.tr, style: Styles.headLineStyle3),
                          Text("'\$500.00",
                              style: TextStyle(
                                  color:
                                      currentTheme.colorScheme.onBackground)),
                        ],
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(20)),
                      Container(
                        width: 2,
                        color: Styles.kbtn,
                        height: 50,
                        child: Divider(),
                      ),
                      SizedBox(width: GetSize.getScreenWidthDevice(20)),
                      Column(
                        children: [
                          Text('Seats'.tr, style: Styles.headLineStyle3),
                          SizedBox(height: GetSize.getScreenHeightDevice(20)),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: _buildSelectedSeatContainers(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: currentTheme.colorScheme.onBackground),
                SizedBox(height: GetSize.getScreenHeightDevice(30)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodOrderPage()),
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
                        child: Text('Continoue'.tr,
                            style: TextStyle(
                                color: currentTheme.colorScheme.onBackground,
                                fontSize: 18))),
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

  // Function to update selected seats
  void _updateSelectedSeats() {
    setState(() {
      selectedSeatsList = _getSelectedSeats();
    });
  }

  // Function to get a list of selected seats
  List<String> _getSelectedSeats() {
    List<String> seats = [];
    selectedItems.forEach((key, value) {
      if (value) {
        seats.add(key);
      }
    });
    return seats;
  }

  // Function to build containers for selected seats
  List<Widget> _buildSelectedSeatContainers() {
    //final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return selectedSeatsList.map((seat) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          seat,
          style: TextStyle(color: Colors.white),
        ),
      );
    }).toList();
  }
}

class SelectableGrid extends StatefulWidget {
  final List<String> items;
  final Map<String, bool> selectedItems;
  final Function()
      updateSelectedSeats; // Callback function to update selected seats

  const SelectableGrid(
      {Key? key,
      required this.items,
      required this.selectedItems,
      required this.updateSelectedSeats})
      : super(key: key);

  @override
  _SelectableGridState createState() => _SelectableGridState();
}

class _SelectableGridState extends State<SelectableGrid> {
  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Provider.of<ThemeProvider>(context).theme;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        String item = widget.items[index];
        bool isSelected = widget.selectedItems[item] ?? false;

        return GestureDetector(
          onTap: () {
            setState(() {
              widget.selectedItems[item] = !isSelected;

              // Call the callback to update the selected seats
              widget.updateSelectedSeats();
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected
                    ? Colors.blue
                    : currentTheme.colorScheme.onBackground,
              ),
              color: isSelected ? null : Colors.grey,
            ),
            child: Center(
              child: Text(item),
            ),
          ),
        );
      },
    );
  }
}
