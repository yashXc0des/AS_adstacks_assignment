import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeMiddleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // First Row - Gradient container
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color.fromRGBO(14, 7, 37, 1),      // Deep indigo
                              Color.fromRGBO(92, 3, 188, 1),     // Purple
                              Color.fromRGBO(234, 55, 152, 1),   // Vibrant pink
                              Color(0xFFF6B6C8),                 // Peach pink (dominant)
                            ],
                            stops: [0.0, 0.25, 0.45, 0.7],
                          ),



                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ETHEREUM 2.0',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Top Rated',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Project',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Trending project and high rated .',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    'Project Created by team',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize:10,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    width: 120, // Increase width here
                                    height: 30, // Decrease height here
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10, // Optional: fine-tune internal padding
                                          vertical: 4,
                                        ),
                                      ),
                                      child: Text('Learn More',style: TextStyle(fontSize: 10),),
                                    ),
                                  )

                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Lottie.asset("assets/lotte/Animation1.json"),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      // Second Row - Projects and Creators
                      SizedBox(
                        height: 300,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'All Projects',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: ListView(
                                        children: [
                                          _buildProjectCard(
                                            title: 'Mobile App Design',
                                            projectId: '#Project 1',
                                            isSelected: true,
                                          ),
                                          SizedBox(height: 10),
                                          _buildProjectCard(
                                            title: 'Web Dashboard',
                                            projectId: '#Project 2',
                                            isSelected: false,
                                          ),
                                          SizedBox(height: 10),
                                          _buildProjectCard(
                                            title: 'Brand Identity',
                                            projectId: '#Project 3',
                                            isSelected: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Top Creators',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'Name',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              'Artwork',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'Rating',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: ListView(
                                        children: [
                                          _buildCreatorCard(name: 'Anna Johnson', artwork: '1289', rating: 0.85),
                                          _buildCreatorCard(name: 'Mike Wilson', artwork: '1045', rating: 0.75),
                                          _buildCreatorCard(name: 'Sarah Parker', artwork: '983', rating: 0.68),
                                          _buildCreatorCard(name: 'David Chen', artwork: '879', rating: 0.62),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      // Third Row - Chart
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Overall Performance This Year',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: Colors.purple,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text('Project Done'),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Row(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text('Pending Done'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Expanded(child: PerformanceLineChart()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String projectId,
    required bool isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.red : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(Icons.image, color: Colors.white),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      projectId,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'See project details',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCreatorCard({
    required String name,
    required String artwork,
    required double rating,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey.withOpacity(0.3),
            child: Icon(Icons.person, size: 18, color: Colors.white),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(name, style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
          Expanded(
            flex: 1,
            child: Text(artwork, style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
          Expanded(
            flex: 2,
            child: LinearPercentIndicator(
              percent: rating,
              lineHeight: 8,
              backgroundColor: Colors.grey.withOpacity(0.3),
              progressColor: Colors.blue,
              padding: EdgeInsets.zero,
              barRadius: Radius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

class PerformanceLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          horizontalInterval: 10,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.withOpacity(0.2),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey.withOpacity(0.2),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 2,
              getTitlesWidget: (value, meta) {
                const labels = {
                  0: '2015',
                  2: '2016',
                  4: '2017',
                  6: '2018',
                  8: '2019',
                  10: '2020',
                };
                return Text(
                  labels[value.toInt()] ?? '',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              getTitlesWidget: (value, meta) => Text(
                '${value.toInt()}',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
              reservedSize: 35,
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 50,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 15),
              FlSpot(2, 25),
              FlSpot(4, 20),
              FlSpot(6, 35),
              FlSpot(8, 30),
              FlSpot(10, 45),
            ],
            isCurved: true,
            color: Colors.purple,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.purple.withOpacity(0.1),
            ),
          ),
          LineChartBarData(
            spots: [
              FlSpot(0, 10),
              FlSpot(2, 20),
              FlSpot(4, 15),
              FlSpot(6, 25),
              FlSpot(8, 20),
              FlSpot(10, 30),
            ],
            isCurved: true,
            color: Colors.orange,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.orange.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}
