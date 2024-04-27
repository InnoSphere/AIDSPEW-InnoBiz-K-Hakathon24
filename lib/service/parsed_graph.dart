import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:malaria_prediction/service/parser.dart';

class GraphPage extends StatelessWidget {
  final List<CountryData> countryData;

  const GraphPage({Key? key, required this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph'),
      ),
      body: ListView.builder(
        itemCount: countryData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      countryData[index].name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.7,
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: List.generate(countryData[index].data.length, (i) {
                              return FlSpot(countryData[index].data[i]['year'].toDouble(),
                                  countryData[index].data[i]['cases'].toDouble());
                            }),
                            isCurved: true,
                            color: Colors.blue,
                            // colors: [Colors.blue],
                            barWidth: 4,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(  
                            sideTitles:SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              
                              return Text(value.toString());
                            },
                          ),),
                        
                          leftTitles: AxisTitles(

                          sideTitles:SideTitles(showTitles: true),
                          )
                        ),
                        borderData: FlBorderData(show: true),
                        gridData: FlGridData(show: true),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
