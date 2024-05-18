import 'package:flutter/material.dart';
import 'package:ticketing/utils/app_styles.dart';

class CustomCurvedNavigationBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;

  CustomCurvedNavigationBarItem({
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30),
        Text(label, style: TextStyle(fontSize: 12,color: Styles.textColor)),
      ],
    );
  }
}
