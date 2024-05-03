import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:TrackTheSpend/graph/bar_data.dart';

class BarGraph extends StatelessWidget {
  final double? maxY;
  final double jSen;
  final double jSel;
  final double jRab;
  final double jKam;
  final double jJum;
  final double jSab;
  final  double jMin;

  const BarGraph({super.key, required this.maxY, required this.jSen, required this.jSel, required this.jRab, required this.jKam, required this.jJum, required this.jSab, required this.jMin});

  

  @override
  Widget build(BuildContext context) {

    BarData myBarData = BarData(jSen: jSen, jSel: jSel, jRab: jRab, jKam: jKam, jJum: jJum, jSab: jSab, jMin: jMin); 

    myBarData.initBarData();

    return Container(
      height: 600,
      width: 380,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.grey[200],),
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: BarChart(BarChartData(
          maxY: maxY,
          minY: 0,
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true,
              getTitlesWidget: bottomTiles
              )
            )
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: myBarData.barData.map((data) => BarChartGroupData(x : data.x, barRods: [
            BarChartRodData(
              toY: data.y,
              color: Colors.black,
              width: 25,
              borderRadius: BorderRadius.circular(2),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: maxY,
                color: Colors.grey
              )
            )
          ])).toList(),
        
        )
          ),
      ),
    );
  }

}
final dayNames = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul'];

Widget bottomTiles(double value, TitleMeta meta) {
  late Widget text;
  if (value.toInt() >= 0 && value.toInt() <7){
    text = Text(dayNames[value.toInt()], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),);
  } else{
    text = Text("", style: TextStyle(color: Colors.transparent),);
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}

