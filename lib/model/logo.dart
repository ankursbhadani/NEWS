import 'package:flutter/material.dart';

class Logo {
  Widget logo({Color color = Colors.white}) {
    return Stack(
      children: [
        Container(
          height: 95,
          width: 95,
          color: const Color(0XFFF42727),
        ),
        Positioned(
          top: 24,
          left: 24,
          child: Container(
            height: 48,
            width: 17,
            color: color,
          ),
        ),
        Positioned(
          top: 24,
          left: 24,
          child: Container(
            height: 17,
            width: 50,
            color: color,
          ),
        ),
        Positioned(
          top: 40,
          left: 24,
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
