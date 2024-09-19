import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';
import '../data/chart_color.dart';
import 'indicator.dart';

class PieChartWidget extends StatefulWidget {
  final List<Map<String, dynamic>> data; // List of title and percentage
  final bool showText; // Control whether to show the text in the chart
  const PieChartWidget({super.key, required this.data,this.showText = false});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartWidget> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.25,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Application Wise Status",
                style: TextStyles(context).googlePoppinsFontsForText(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "No. of Applications by Current Status",
                style: TextStyles(context).googlePoppinsFontsForText(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF3E3838),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              const SizedBox(height: 18),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(),
                    ),
                    swapAnimationCurve: Curves.easeInOutQuint,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.data
                    .asMap()
                    .entries
                    .map((entry) => Column(
                  children: [
                    Indicator(
                      color: getColor(entry.key),
                      text: entry.value['title'],
                      isSquare: true,
                    ),
                    const SizedBox(height: 4),
                  ],
                ))
                    .toList(),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return widget.data.asMap().entries.map((entry) {
      final isTouched = entry.key == touchedIndex;
      final fontSize = isTouched ? 15.0 : 10.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return PieChartSectionData(
        color: getColor(entry.key),
        value: entry.value['percentage'],
        title: widget.showText? '${entry.value['percentage']}%':"",
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: PieChartColors.mainTextColor1,
          shadows: shadows,
        ),
      );
    }).toList();
  }

  Color getColor(int index) {
    // Assign different colors based on the index
    switch (index) {
      case 0:
        return PieChartColors.contentColorPurple;
      case 1:
        return PieChartColors.contentColorBlue;
      case 2:
        return PieChartColors.contentColorPink;
      case 3:
        return PieChartColors.contentColorYellow;
      case 4:
        return PieChartColors.contentColorOrange;
      default:
        return Colors.grey;
    }
  }
}
