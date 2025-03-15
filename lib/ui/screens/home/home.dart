import 'package:flutter/material.dart';
import 'package:sat_basics_c14/main.dart';
import 'package:sat_basics_c14/ui/model/hotel_dm.dart';
import 'package:sat_basics_c14/ui/screens/home/hotel_widget.dart';

class Home extends StatelessWidget {
  static const String routeName = "home";
  List<HotelDM> hotels = [
    HotelDM(name: "Hotel1", image: "assets/hotel1.jpg"),
    HotelDM(name: "Hotel2", image: "assets/hotel1.jpg"),
    HotelDM(name: "Hotel3", image: "assets/hotel1.jpg"),
    HotelDM(name: "Hotel4", image: "assets/hotel1.jpg"),
    HotelDM(name: "Hotel4", image: "assets/hotel1.jpg"),
    HotelDM(name: "Hotel4", image: "assets/hotel1.jpg"),
    HotelDM(name: "Hotel4", image: "assets/hotel1.jpg"),
    HotelDM(name: "Hotel4", image: "assets/hotel1.jpg"),
    HotelDM(name: "Hotel4", image: "assets/hotel1.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    Function x;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Title"),
          actions: [Text("Title"), Icon(Icons.add)],
          leading: Icon(Icons.back_hand),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: blueDecoration,
                child: Text(
                  "Available Hotels",
                  style: white700BoldStyle,
                  textAlign: TextAlign.center,
                )),
            Expanded(
              child: ListView.builder(
                  itemCount: hotels.length,
                  itemBuilder: (BuildContext context, int index) =>
                      HotelWidget(model: hotels[index])),
            )
          ],
        ),
        backgroundColor: Color(0xffffffff));
  }
}
