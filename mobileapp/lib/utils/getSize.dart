import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetSize {
  static getSizeHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getSizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeightOfDevice() {
    return Get.height;
  }

  static getWidthOfDevice() {
    return Get.width;
  }

  static getScreenHeightDevice(double pixels) {
    double height = getHeightOfDevice() / pixels;
    return getHeightOfDevice() / height;
  }

  static getScreenWidthDevice(double pixels) {
    double width = getWidthOfDevice() / pixels;
    return getWidthOfDevice() / width;
  }
}
