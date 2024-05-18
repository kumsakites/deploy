import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing/utils/app_styles.dart';
import 'package:ticketing/utils/getSize.dart';

class CircleListItem extends StatefulWidget {
  const CircleListItem({super.key});

  @override
  State<CircleListItem> createState() => _CircleListItemState();
}

class _CircleListItemState extends State<CircleListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _buidCircleImage1(),
            _buildText1(),
          ],
        ),
         Column(
          children: [
            _buidCircleImage2(),
            _buildText2(),
          ],
        ),
         Column(
          children: [
            _buidCircleImage3(),
            _buildText3(),
          ],
        ),
         Column(
          children: [
            _buidCircleImage4(),
            _buildText4(),
          ],
        ),
         Column(
          children: [
            _buidCircleImage5(),
            _buildText5(),
          ],
        ),
         Column(
          children: [
            _buidCircleImage6(),
            _buildText6(),
          ],
        ),
         Column(
          children: [
            _buidCircleImage7(),
            _buildText7(),
          ],
        ),
      ],
    );
  }
}
// circle image and text widget
Widget _buidCircleImage1(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: GetSize.getScreenWidthDevice(8),vertical: GetSize.getScreenHeightDevice(8)),
  child: Container(
    height: GetSize.getScreenHeightDevice(75),
    width: GetSize.getScreenWidthDevice(75),
    padding: EdgeInsets.all(0.5),
    decoration: BoxDecoration(
      color: Styles.kakiColor,
      border: new Border.all(
        color: Colors.black54
      ),
      borderRadius: new BorderRadius.only(
        topLeft: Radius.circular(40),
         topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
           bottomRight: Radius.circular(40),
      ),
    ),
  
  child: ClipOval(child: Image.asset("images/cenema.png",fit: BoxFit.cover,)),),);
}
Widget _buildText1(){
  return Text("Comedy".tr,style: Styles.headLineStyle3,);
}
Widget _buidCircleImage2(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: GetSize.getScreenWidthDevice(8),vertical: GetSize.getScreenHeightDevice(8)),
  child: Container(
    height: GetSize.getScreenHeightDevice(75),
    width: GetSize.getScreenWidthDevice(75),
    padding: EdgeInsets.all(0.5),
    decoration: BoxDecoration(
      color: Styles.kakiColor,
      border: new Border.all(
        color: Colors.black54
      ),
      borderRadius: new BorderRadius.only(
        topLeft: Radius.circular(40),
         topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
           bottomRight: Radius.circular(40),
      ),
    ),
  
  child: ClipOval(child: Image.asset("images/gog.png",fit: BoxFit.cover,)),),);
}
Widget _buildText2(){
  return Text("Fantasy".tr,style: Styles.headLineStyle3,);
}
Widget _buidCircleImage3(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: GetSize.getScreenWidthDevice(8),vertical: GetSize.getScreenHeightDevice(8)),
  child: Container(
    height: GetSize.getScreenHeightDevice(75),
    width: GetSize.getScreenWidthDevice(75),
    padding: EdgeInsets.all(0.5),
    decoration: BoxDecoration(
      color: Styles.kakiColor,
      border: new Border.all(
        color: Colors.black54
      ),
      borderRadius: new BorderRadius.only(
        topLeft: Radius.circular(40),
         topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
           bottomRight: Radius.circular(40),
      ),
    ),
  
  child: ClipOval(child: Image.asset("images/cenema.png",fit: BoxFit.cover,)),),);
}
Widget _buildText3(){
  return Text("Action".tr,style: Styles.headLineStyle3,);
}
Widget _buidCircleImage4(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: GetSize.getScreenWidthDevice(8),vertical: GetSize.getScreenHeightDevice(8)),
  child: Container(
    height: GetSize.getScreenHeightDevice(75),
    width: GetSize.getScreenWidthDevice(75),
    padding: EdgeInsets.all(0.5),
    decoration: BoxDecoration(
      color: Styles.kakiColor,
      border: new Border.all(
        color: Colors.black54
      ),
      borderRadius: new BorderRadius.only(
        topLeft: Radius.circular(40),
         topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
           bottomRight: Radius.circular(40),
      ),
    ),
  
  child: ClipOval(child: Image.asset("images/cenema.png",fit: BoxFit.cover,)),),);
}
Widget _buildText4(){
  return Text("Horor".tr,style: Styles.headLineStyle3,);
}
Widget _buidCircleImage5(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: GetSize.getScreenWidthDevice(8),vertical: GetSize.getScreenHeightDevice(8)),
  child: Container(
    height: GetSize.getScreenHeightDevice(75),
    width: GetSize.getScreenWidthDevice(75),
    padding: EdgeInsets.all(0.5),
    decoration: BoxDecoration(
      color: Styles.kakiColor,
      border: new Border.all(
        color: Colors.black54
      ),
      borderRadius: new BorderRadius.only(
        topLeft: Radius.circular(40),
         topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
           bottomRight: Radius.circular(40),
      ),
    ),
  
  child: ClipOval(child: Image.asset("images/cenema.png",fit: BoxFit.cover,)),),);
}
Widget _buildText5(){
  return Text("Documentation".tr,style: Styles.headLineStyle3,);
}
Widget _buidCircleImage6(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: GetSize.getScreenWidthDevice(8),vertical: GetSize.getScreenHeightDevice(8)),
  child: Container(
    height: GetSize.getScreenHeightDevice(75),
    width: GetSize.getScreenWidthDevice(75),
    padding: EdgeInsets.all(0.5),
    decoration: BoxDecoration(
      color: Styles.kakiColor,
      border: new Border.all(
        color: Colors.black54
      ),
      borderRadius: new BorderRadius.only(
        topLeft: Radius.circular(40),
         topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
           bottomRight: Radius.circular(40),
      ),
    ),
  
  child: ClipOval(child: Image.asset("images/cenema.png",fit: BoxFit.cover,)),),);
}
Widget _buildText6(){
  return Text("News paper".tr,style: Styles.headLineStyle3,);
}
Widget _buidCircleImage7(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: GetSize.getScreenWidthDevice(8),vertical: GetSize.getScreenHeightDevice(8)),
  child: Container(
    height: GetSize.getScreenHeightDevice(75),
    width: GetSize.getScreenWidthDevice(75),
    padding: EdgeInsets.all(0.5),
    decoration: BoxDecoration(
      color: Styles.kakiColor,
      border: new Border.all(
        color: Colors.black54
      ),
      borderRadius: new BorderRadius.only(
        topLeft: Radius.circular(40),
         topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
           bottomRight: Radius.circular(40),
      ),
    ),
  
  child: ClipOval(child: Image.asset("images/cenema.png",fit: BoxFit.cover,)),),);
}
Widget _buildText7(){
  return Text("Art".tr,style: Styles.headLineStyle3,);
}