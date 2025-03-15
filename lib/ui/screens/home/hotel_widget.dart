import 'package:flutter/material.dart';
import 'package:sat_basics_c14/main.dart';
import 'package:sat_basics_c14/ui/model/hotel_dm.dart';

class HotelWidget extends StatelessWidget {
  HotelDM model;

  HotelWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(model.image),
        Container(
            width: double.infinity,
            decoration: blueDecoration,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              model.name,
              style: white700BoldStyle,
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
