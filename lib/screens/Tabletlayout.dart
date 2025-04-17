import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Attendance.dart';
import 'Employee.dart';
import 'HomeMiddleSection.dart';
import 'Information.dart';
import 'package:adstacks_media_assignment/screens/settings.dart';
import 'package:adstacks_media_assignment/screens/sidebar_rightpart.dart';
import 'package:adstacks_media_assignment/screens/summary.dart';

class TabletLayout extends StatefulWidget {
  @override
  _TabletLayoutState createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  int _selectedIndex = 0;
  bool _isWorkspaceSelected = false;
  bool _isAdstacksExpanded = false;
  bool _isFinanceExpanded = false;

  final List<Widget> _middleSections = [
    HomeMiddleSection(),
    EmployeesSection(),
    AttendanceScreen(),
    SummarySection(),
    InformationSection(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 30), () {
      _showHRMessagePopup();
    });
  }
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'yashparashar136@gmail.com',
      queryParameters: {
        'subject': 'Let\'s Work Together',
        'body': 'Hello Yash,\n\nLooking forward to working with you!',
      },
    );

    try {
      // Use launchUrl directly
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Could not launch email: $e');
    }
  }

  void _toggleWorkspaceSelection() {
    setState(() {
      _isWorkspaceSelected = !_isWorkspaceSelected;
      _isAdstacksExpanded = _isWorkspaceSelected;
      _isFinanceExpanded = _isWorkspaceSelected;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showFinancePopup() {
    _showCustomPopup(
      title: 'Finance Details',
      lottieAsset: "assets/lotte/commingsoon.json",
    );
  }

  void _showAdstacksPopup() {
    _showCustomPopup(
      title: 'Adstacks Details',
      lottieAsset: "assets/lotte/commingsoon.json",
    );
  }

  void _showCustomPopup({
    required String title,
    required String lottieAsset,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(maxWidth: 500),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Color(0xFF333333), Color(0xFF555555)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 40, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Colors.white, Color(0xFFCCCCCC)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        child: Text(
                          "COMING SOON!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 200,
                        child: Lottie.asset(lottieAsset, fit: BoxFit.contain),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showHRMessagePopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(maxWidth: 500),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/lotte/commingsoon.json', height: 200),
              SizedBox(height: 20),
              Text(
                'Hello HR @AS Adstacks!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                'I’ve built this in just 5–6 hours and I can do much more.\n\nFlutter is love 💙🔥\nLet’s build amazing apps together!',
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                '📱 Mobile: 7082131366\n✉️ Email: yashparashar136@gmail.com',
                style: TextStyle(fontSize: 14, color: Colors.white60),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _launchEmail,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Let’s Make Awesome Apps!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        if (screenWidth < 800) {
          return Scaffold(
            body: Center(child: Text("Please use a larger screen or tablet.")),
          );
        }

        return SafeArea(
          child: Scaffold(
            body: Row(
              children: [
                // Left Panel
                Container(
                  width: 240,
                  height: screenHeight,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset("assets/images/logo.png", height: 40),
                        SizedBox(height: 10),
                        Divider(thickness: 1.5, color: Colors.grey[400], indent: 8, endIndent: 8),
                        SizedBox(height: 15),
                        CircleAvatar(radius: 50, backgroundImage: AssetImage("assets/images/pfp.png")),
                        SizedBox(height: 6),
                        Text('Pooja Mishra', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        SizedBox(height: 5),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            minimumSize: Size(70, 40),
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                          ),
                          child: Text('ADMIN', style: TextStyle(fontSize: 10)),
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1.5, color: Colors.grey[400], indent: 5, endIndent: 5),
                        SizedBox(height: 5),

                        ...['Home', 'Employees', 'Attendance', 'Summary', 'Information']
                            .asMap()
                            .entries
                            .map((entry) {
                          final List<IconData> icons = [
                            Icons.home,
                            Icons.people,
                            Icons.calendar_today,
                            Icons.bar_chart,
                            Icons.info,
                          ];
                          final bool isSelected = _selectedIndex == entry.key;

                          return Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.grey[100] : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: ListTile(
                                dense: true,
                                leading: Icon(icons[entry.key], size: 16),
                                title: Text(entry.value, style: TextStyle(fontSize: 14)),
                                selected: isSelected,
                                selectedColor: Colors.black,
                                onTap: () => _onItemTapped(entry.key),
                              ),
                            ),
                          );
                        }).toList(),

                        // Workspace section
                        Container(
                          decoration: BoxDecoration(
                            color: _isWorkspaceSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: ListTile(
                            dense: true,
                            title: Text('WORKSPACE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.add, size: 20),
                            onTap: _toggleWorkspaceSelection,
                          ),
                        ),

                        if (_isAdstacksExpanded)
                          ListTile(
                            dense: true,
                            title: Text('Adstacks', style: TextStyle(fontSize: 14)),
                            onTap: _showAdstacksPopup,
                          ),

                        if (_isFinanceExpanded)
                          ListTile(
                            dense: true,
                            title: Text('Finance', style: TextStyle(fontSize: 14)),
                            onTap: _showFinancePopup,
                          ),

                        SizedBox(height: 10),

                        ListTile(
                          dense: true,
                          leading: Icon(Icons.settings, size: 16),
                          title: Text('Settings', style: TextStyle(fontSize: 14)),
                          selected: _selectedIndex == 5,
                          selectedColor: Colors.black,
                          onTap: () => _onItemTapped(5),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(Icons.logout, size: 16),
                          title: Text('Logout', style: TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                ),

                // Middle Panel
                Expanded(
                  child: _selectedIndex == 5
                      ? SettingsScreen()
                      : Padding(
                    padding: EdgeInsets.only(left: 5, top: 10, right: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: Icon(Icons.search, color: Colors.white),
                                filled: true,
                                fillColor: Colors.black,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                hintStyle: TextStyle(color: Colors.white70),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Expanded(child: _middleSections[_selectedIndex]),
                      ],
                    ),
                  ),
                ),

                // Right Panel
                RightPanel(),
              ],
            ),
          ),
        );
      },
    );
  }
}
