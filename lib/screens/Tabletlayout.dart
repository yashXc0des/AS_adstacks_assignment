import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Attendance.dart';
import 'Employee.dart';
import 'HomeMiddleSection.dart';
import 'Information.dart';
import 'summary.dart';

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
    AttendanceSection(),
    SummarySection(),
    InformationSection(),
  ];

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

// Reusable function for both popups
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
              colors: [
                Colors.black,
                Color(0xFF333333),
                Color(0xFF555555),
              ],
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
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Main Content
              Padding(
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
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.05),
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 200,
                            child: Lottie.asset(
                              lottieAsset,
                              fit: BoxFit.contain,
                            ),
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
                        elevation: 5,
                      ),
                      child: Text(
                        'Close',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
                // Left Navigation Panel
              // Left Navigation Panel
              Container(
              width: 240, // Fixed width for the left panel
              height: screenHeight, // Set height based on screen height
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/images/logo.png", height: 40),
                    SizedBox(height: 10),
                    Divider(thickness: 1.5, color: Colors.grey[400], indent: 8, endIndent: 8),
                    SizedBox(height: 15),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/pfp.png"),
                    ),
                    SizedBox(height: 6),
                    Text('Pooja Mishra', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    SizedBox(height: 5),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        minimumSize: Size(70, 40),
                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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

                    // Workspace Section
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
                        title: Text(
                          'WORKSPACE',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        trailing: Icon(Icons.add, size: 20, color: Colors.black),
                        onTap: _toggleWorkspaceSelection,
                      ),
                    ),

                    // Adstacks Section (Only if expanded)
                    if (_isAdstacksExpanded)
                      ListTile(
                        dense: true,
                        title: Text('Adstacks', style: TextStyle(fontSize: 14)),
                        onTap: _showAdstacksPopup,
                      ),

                    // Finance Section (Only if expanded)
                    if (_isFinanceExpanded)
                      ListTile(
                        dense: true,
                        title: Text('Finance', style: TextStyle(fontSize: 14)),
                        onTap: _showFinancePopup,
                      ),

                    SizedBox(height: 10),

                    // Settings & Logout
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.settings, size: 16),
                      title: Text('Settings', style: TextStyle(fontSize: 14)),
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



                // Main Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, top: 10, right: 10), // Top padding stays
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            widthFactor: 0.5, // Now it's 60% width (40% empty on left)
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
                // Right Panel (Fixed for overflow)
                Container(
                  width: screenWidth * 0.22,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(icon: Icon(Icons.inbox_rounded), onPressed: () {}),
                                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                                IconButton(icon: Icon(Icons.power_settings_new), onPressed: () {}),
                              ],
                            ),
                            CircleAvatar(radius: 20),
                          ],
                        ),
                      ),

                      // Scrollable Content Area
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              // Calendar
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Text('October 2023', style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Table(
                                      children: [
                                        TableRow(
                                          children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                                              .map((d) => Center(child: Text(d)))
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),

                              // Birthdays
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.orange[50],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Today\'s Birthdays'),
                                    Chip(label: Text('2')),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),

                              // Anniversaries
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.pink[50],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Anniversaries'),
                                    Chip(label: Text('3')),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
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
      },
    );
  }
}
Widget _buildCalendarDay(int? day) {
  bool isToday = day == 18; // Assuming today is the 18th

  return Expanded(
    child: AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isToday ? Colors.blue[700] : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: day != null
              ? Text(
            day.toString(),
            style: TextStyle(
              color: isToday ? Colors.white : Colors.black,
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            ),
          )
              : Text(''),
        ),
      ),
    ),
  );
}