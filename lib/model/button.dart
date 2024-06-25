
import 'package:flutter/material.dart';

class Button {
  Widget button({
    String title = 'title',
    Color backgroundColor = Colors.grey,
    Color textColor = Colors.black45,
    required VoidCallback onTap,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 15,
    IconData icons = Icons.email_outlined,
  }) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
          backgroundColor: backgroundColor,
          // This will set the button color
        ),
        child: Row(
          children: [
            Icon(icons,color: Colors.white,size: 25,),
            const SizedBox(width: 100,),
            Text(title,style: TextStyle(color: textColor,fontWeight: fontWeight,fontSize: fontSize),),
          ],
        ),
      ),
    );
  }
}
