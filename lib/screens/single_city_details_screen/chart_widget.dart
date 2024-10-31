import 'package:api_repository/api_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:raintonic/styles.dart';

class TemperatureChart extends StatelessWidget {
  final TemperatureModel? data;
  const TemperatureChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List<DataPoints> dataPoints = data?.hourly?.createDataPoints() ?? [];

    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: Card(
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: dataPoints
                    .asMap()
                    .entries
                    .map((x) => FlSpot(
                        x.value.dateTime.hour.toDouble(), x.value.temperature))
                    .toList(),
                isCurved: true,
                barWidth: 2,
                color: Styles.primaryColor,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.3),
                ),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 24,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index >= 0 && index < dataPoints.length) {
                      var timeData = dataPoints[index].dateTime;
                      return Text(
                        '${timeData.month}-${timeData.day}',
                        style: const TextStyle(fontSize: 10),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            gridData: const FlGridData(show: true),
            borderData: FlBorderData(show: true),
            lineTouchData: const LineTouchData(enabled: true),
          ),
        ),
      ),
    );
  }
}
