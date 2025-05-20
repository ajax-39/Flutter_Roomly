import 'package:flutter/material.dart';
import 'package:hotelbooking/services/widget_support.dart';

class DetailePage extends StatefulWidget {
  const DetailePage({super.key});

  @override
  _DetailePageState createState() => _DetailePageState();
}

class _DetailePageState extends State<DetailePage> {
  final TextEditingController _guestsController = TextEditingController(
    text: "1",
  );

  @override
  void dispose() {
    _guestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      child: Image.asset(
                        "assets/images/hotel1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 50.0, left: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      "Hotel Beach",
                      style: AppWidget.headlinetextstyle(27.0),
                    ),
                    Text("\$20", style: AppWidget.normaltextstyle(27.0)),
                    Divider(thickness: 2.0),
                    SizedBox(height: 10.0),
                    Text(
                      "What this place offers",
                      style: AppWidget.headlinetextstyle(22),
                    ),
                    SizedBox(height: 15.0),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.wifi, color: Colors.blue, size: 30),
                            SizedBox(width: 10.0),
                            Text(
                              "WiFi",
                              style: AppWidget.normaltextstyle(23.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          children: [
                            Icon(Icons.tv, color: Colors.blue, size: 30),
                            SizedBox(width: 10.0),
                            Text(
                              "HDTV",
                              style: AppWidget.normaltextstyle(23.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          children: [
                            Icon(Icons.kitchen, color: Colors.blue, size: 30),
                            SizedBox(width: 10.0),
                            Text(
                              "Kitchen",
                              style: AppWidget.normaltextstyle(23.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          children: [
                            Icon(Icons.bathroom, color: Colors.blue, size: 30),
                            SizedBox(width: 10.0),
                            Text(
                              "Bathroom",
                              style: AppWidget.normaltextstyle(23.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(thickness: 2.0),
                    SizedBox(height: 5),
                    Text(
                      "About this place",
                      style: AppWidget.headlinetextstyle(22),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                      "Sed do eiusmod tempor incididunt ut labore et dolore "
                      "magna aliqua. Ut enim ad minim veniam, quis nostrud ",
                      style: AppWidget.normaltextstyle(16),
                    ),
                    SizedBox(height: 20.0),
                    Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0),
                            Text(
                              "\$100 for 4 nights",
                              style: AppWidget.headlinetextstyle(22),
                            ),
                            SizedBox(height: 10.0),
                            Divider(),
                            Text(
                              "Check-in Date",
                              style: AppWidget.normaltextstyle(16),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                Icon(Icons.calendar_today, color: Colors.blue),
                                SizedBox(width: 10),
                                Text(
                                  "02,Apr 2025",
                                  style: AppWidget.normaltextstyle(16),
                                ),
                              ],
                            ),
                            Divider(),
                            Text(
                              "Check-out Date",
                              style: AppWidget.normaltextstyle(16),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                Icon(Icons.calendar_today, color: Colors.blue),
                                SizedBox(width: 10),
                                Text(
                                  "05,Apr 2025",
                                  style: AppWidget.normaltextstyle(16),
                                ),
                              ],
                            ),
                            Divider(),
                            Text(
                              "Number of Guests",
                              style: AppWidget.normaltextstyle(16),
                            ),
                            SizedBox(height: 5.0),
                            TextField(
                              controller: _guestsController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                              ),
                              style: AppWidget.normaltextstyle(16),
                            ),
                            SizedBox(height: 15.0),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                ),
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
