import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RightPanel extends StatefulWidget {
  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final panelWidth = screenWidth * 0.22;

        return Container(
          width: panelWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(2, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              // Top icons and profile picture
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.inbox_rounded, color: Colors.grey[600], size: 20),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications, color: Colors.grey[600], size: 20),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.power_settings_new, color: Colors.grey[600], size: 20),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/images/pfp.png'),
                    ),
                  ],
                ),
              ),

              // Scrollable section
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Color(0xFF1B254A),
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "GENERAL 10:00 AM TO 7:00 PM ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              letterSpacing: 0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        _buildCalendarSection(),
                        SizedBox(height: 16),
                        _buildEventSection(
                          color: Colors.grey[200]!,
                          imagePath: "assets/images/stars.png",
                          title: "Today Birthdays",
                          count: 2,
                          buttonColor:  Colors.purple[600]!,
                          buttonText: 'Send Wishes',
                          containerHeight: 250,
                          panelWidth: panelWidth,
                        ),
                        SizedBox(height: 16),
                        _buildEventSection(
                          color: Colors.grey[300]!,
                          imagePath: "assets/images/stars.png",
                          title: "Anniversaries",
                          count: 3,
                          buttonColor: Colors.purple[600]!,
                          buttonText: 'Anniversary Wishes',
                          containerHeight: 250,
                          panelWidth: panelWidth,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCalendarSection() {
    return Container(
      height: 230,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        calendarFormat: CalendarFormat.month,
        startingDayOfWeek: StartingDayOfWeek.monday,
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          selectedDecoration: BoxDecoration(
            color: Colors.blue[600],
            shape: BoxShape.circle,
          ),
          defaultTextStyle: TextStyle(fontSize: 10),
          weekendTextStyle: TextStyle(fontSize: 10, color: Colors.grey[600]),
          todayTextStyle: TextStyle(fontSize: 10, color: Colors.white),
          selectedTextStyle: TextStyle(fontSize: 10, color: Colors.white),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(fontSize: 9, color: Colors.grey[800]),
          weekendStyle: TextStyle(fontSize: 9, color: Colors.grey[600]),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
          leftChevronIcon: Icon(Icons.chevron_left, size: 14, color: Colors.grey[600]),
          rightChevronIcon: Icon(Icons.chevron_right, size: 14, color: Colors.grey[600]),
        ),
        rowHeight: 26,
        calendarBuilders: CalendarBuilders(
          todayBuilder: (context, day, focusedDay) {
            return Center(
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
      ),
    );
  }

  Widget _buildEventSection({
    required Color color,
    required String imagePath,
    required String title,
    required int count,
    required Color buttonColor,
    required String buttonText,
    required double panelWidth,
    double containerHeight = 200,
  }) {
    return Container(
      height: containerHeight,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imagePath, height: 40, width: 20),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Image.asset(imagePath, height: 40, width: 20),
            ],
          ),
          SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              count,
                  (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.black12,
                  backgroundImage: AssetImage('assets/images/img.png',),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Total: $count',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          FractionallySizedBox(
            widthFactor: 0.7, // 70% of parent width
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              icon: Icon(Icons.send, size: 14, color: Colors.white),
              label: Text(
                buttonText,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
