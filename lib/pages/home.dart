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
      body: SingleChildScrollView(
        child: Container(
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
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                                          MediaQuery.of(context).size.width /
                                          3.5,
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                                          MediaQuery.of(context).size.width /
                                          3.5,
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                                          MediaQuery.of(context).size.width /
                                          3.5,
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
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Discover new places",
                  style: AppWidget.headlinetextstyle(22),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "assets/images/mumbai.jpg",
                                  height: 200,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Mumbai",
                                  style: AppWidget.headlinetextstyle(20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.house_outlined,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "10 Hotels",
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
                      margin: EdgeInsets.only(left: 20.0, bottom: 5),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "assets/images/newyork.jpg",
                                  height: 200,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "New York",
                                  style: AppWidget.headlinetextstyle(20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.house_outlined,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "7 Hotels",
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
                      margin: EdgeInsets.only(left: 20.0, bottom: 5),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "assets/images/bali.jpg",
                                  height: 200,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Bali",
                                  style: AppWidget.headlinetextstyle(20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.house_outlined,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "3 Hotels",
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
                      margin: EdgeInsets.only(left: 20.0, bottom: 5),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "assets/images/dubai.jpg",
                                  height: 200,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Debai",
                                  style: AppWidget.headlinetextstyle(20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.house_outlined,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "12 Hotels",
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
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
