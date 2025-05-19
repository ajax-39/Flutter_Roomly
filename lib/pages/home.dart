import 'package:flutter/material.dart';
import 'package:hotelbooking/services/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 241, 241),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image.asset(
                    "assets/images/home.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'India,Delhi',
                            style: AppWidget.whitetextstyle(20.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Hey Atharv! Tell us where you want to go?",
                        style: AppWidget.whitetextstyle(24.0),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(103, 255, 255, 255),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            hintText: "Search Places...",
                            hintStyle: AppWidget.whitetextstyle(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'The most relavent',
                style: AppWidget.headlinetextstyle(22),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 330,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        margin: EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "assets/images/hotel1.jpg",
                                width: MediaQuery.of(context).size.width / 1.2,
                                fit: BoxFit.cover,
                                height: 230,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Hotel Beach",
                                    style: AppWidget.headlinetextstyle(22),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                  ),
                                  Text(
                                    "\$20",
                                    style: AppWidget.headlinetextstyle(25),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 30.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "Near Main Market, delhi",
                                    style: AppWidget.normaltextstyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        margin: EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "assets/images/hotel2.jpg",
                                width: MediaQuery.of(context).size.width / 1.2,
                                fit: BoxFit.cover,
                                height: 230,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Hotel Beach",
                                    style: AppWidget.headlinetextstyle(22),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                  ),
                                  Text(
                                    "\$20",
                                    style: AppWidget.headlinetextstyle(25),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 30.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "Near Main Market, delhi",
                                    style: AppWidget.normaltextstyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        margin: EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "assets/images/hotel3.jpg",
                                width: MediaQuery.of(context).size.width / 1.2,
                                fit: BoxFit.cover,
                                height: 230,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Hotel Beach",
                                    style: AppWidget.headlinetextstyle(22),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                  ),
                                  Text(
                                    "\$20",
                                    style: AppWidget.headlinetextstyle(25),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 30.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "Near Main Market, delhi",
                                    style: AppWidget.normaltextstyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
