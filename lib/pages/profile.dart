import 'package:flutter/material.dart';
import 'package:hotelbooking/pages/login.dart';
import 'package:hotelbooking/services/firebase_services.dart';
import 'package:hotelbooking/services/widget_support.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseServices _firebaseServices = FirebaseServices();
  Map<String, dynamic>? _userData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final userData = await _firebaseServices.getUserDetails();
      setState(() {
        _userData = userData;
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to load user data",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    try {
      await _firebaseServices.signOut();
      Fluttertoast.showToast(
        msg: "Logged out successfully",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const Login())
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to logout. Try again.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: AppWidget.headlinetextstyle(20.0),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      TextButton(
                        child: Text("Logout", style: TextStyle(color: Colors.red)),
                        onPressed: () {
                          Navigator.of(context).pop();
                          _logout();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            tooltip: "Logout",
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Card
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _userData?["name"] ?? "User",
                                  style: AppWidget.headlinetextstyle(20.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  _userData?["email"] ?? "Email not available",
                                  style: AppWidget.normaltextstyle(14.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text(
                                      "Joined: ${_formatTimestamp(_userData?["createdAt"])}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg: "Edit profile feature coming soon",
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 25),
                    
                    // Personal Information Section
                    _buildProfileSection("Account Information"),
                    
                    // Personal Details Card
                    _buildInfoCard(
                      title: "Personal Details",
                      icon: Icons.person,
                      items: [
                        InfoItem(title: "Full Name", value: _userData?["name"] ?? "Not set"),
                        InfoItem(title: "Email", value: _userData?["email"] ?? "Not available"),
                        InfoItem(title: "User ID", value: _userData?["userId"] ?? "Not available"),
                      ],
                    ),
                    
                    SizedBox(height: 15),
                    
                    // Profile Options
                    _buildProfileOption(Icons.location_on, "Manage Addresses"),
                    _buildProfileOption(Icons.payment, "Payment Methods"),
                    _buildProfileOption(Icons.history, "Booking History"),
                    
                    SizedBox(height: 15),
                    _buildProfileSection("App Settings"),
                    _buildProfileOption(Icons.notifications, "Notifications"),
                    _buildProfileOption(Icons.language, "Language Settings"),
                    _buildProfileOption(Icons.dark_mode, "Appearance"),
                    
                    SizedBox(height: 15),
                    _buildProfileSection("Support & Help"),
                    _buildProfileOption(Icons.help_outline, "Help Center"),
                    _buildProfileOption(Icons.info_outline, "About Us"),
                    _buildProfileOption(Icons.privacy_tip_outlined, "Privacy Policy"),
                    _buildProfileOption(Icons.description_outlined, "Terms & Conditions"),
                    
                    SizedBox(height: 25),
                    
                    // Logout Button
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: MaterialButton(
                        height: 50,
                        minWidth: double.infinity,
                        onPressed: _logout,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // App Version
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Text(
                          "App Version: 1.0.0",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  String _formatTimestamp(dynamic timestamp) {
    if (timestamp == null) return "Recently";
    try {
      final DateTime dateTime = timestamp.toDate();
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    } catch (e) {
      return "Recently";
    }
  }

  Widget _buildProfileSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 5),
      ],
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.blue, size: 22),
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: AppWidget.normaltextstyle(16.0),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required List<InfoItem> items,
  }) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue, size: 22),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(height: 25),
            ...items.map((item) => _buildInfoRow(item)).toList(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInfoRow(InfoItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.title,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
          Text(
            item.value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoItem {
  final String title;
  final String value;
  
  InfoItem({required this.title, required this.value});
}
