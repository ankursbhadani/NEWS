import 'package:flutter/material.dart';

class Logo {
  Widget logo({Color color = Colors.white}) {
    return Stack(
      children: [
        Container(
          height: 85,
          width: 85,
          color: const Color(0XFFF42727),
        ),
        Positioned(
          top: 20,
          left: 18,
          child: Container(
            height: 48,
            width: 17,
            color: color,
          ),
        ),
        Positioned(
          top: 20,
          left: 18,
          child: Container(
            height: 17,
            width: 50,
            color: color,
          ),
        ),
        Positioned(
          top: 37,
          left: 18,
          child: Container(
            height: 17,
            width: 33,
            color: color,
          ),
        ),
      ],
    );
  }
}
