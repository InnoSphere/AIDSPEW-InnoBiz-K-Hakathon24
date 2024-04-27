import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class DataModel {
  final String seriesName;
  final String countryName;
  final Map<String, dynamic> data;

  DataModel({
    required this.seriesName,
    required this.countryName,
    required this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      seriesName: json['A'],
      countryName: json['B'],
      data: json.map((key, value) {
        if (key != 'A' && key != 'B') {
          // Check if the value is a valid double, otherwise set it to 0.0
          double? parsedValue;
          try {
            parsedValue = double.parse(value.toString());
          } catch (e) {
            print('Error parsing value: $value');
            parsedValue = 0.0;
          }
          return MapEntry(key, parsedValue);
        }
        return MapEntry(key, value);
      }),
    );
  }
}

class Malaria_Graph extends StatelessWidget {
  Future<List<DataModel>> fetchData(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('assets/data.json');
    List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => DataModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Chart Example'),
        ),
        body: FutureBuilder<List<DataModel>>(
          future: fetchData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ChartWithData(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class ChartWithData extends StatelessWidget {
  final List<DataModel> data;

  ChartWithData(this.data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          child: LineChartWithData(data),
        ),
      ),
    );
  }
}

class LineChartWithData extends StatelessWidget {
  final List<DataModel> data;

  LineChartWithData(this.data);

  @override
  Widget build(BuildContext context) {
    return LineChart(
   LineChartData(
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles:  SideTitles(
            showTitles: true,
            // getTextStyles: (value) => const TextStyle(color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
            // margin: 20,
            getTitlesWidget:(value, meta) {
            
              switch (value.toInt()) {
                case 0:
                  return Text(data[0].seriesName);
                case 1:
                  return Text(data[1].seriesName);
                case 2:
                  return Text(data[2].seriesName);
                case 3:
                  return Text(data[3].seriesName);
                default:
                  return Text('');
              }
            },
          ),
          // leftTitles:AxisTiles()
          // leftTitles: SideTitles(showTitles: false),
        ),),
        borderData: FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 0,
        maxX: 3,
        minY: 0,
        maxY: _maxY(),
        lineBarsData: _lineBarsData(),
      ),
     );
  }

  double _maxY() {
    double max = 0;
    for (var item in data) {
      item.data.forEach((key, value) {
        if (value is double && value > max) { // Check if the value is a double
          max = value;
        }
      });
    }
    return max;
  }

 List<LineChartBarData> _lineBarsData() {
  List<LineChartBarData> linesData = [];
  for (var i = 0; i < data.length; i++) {
    List<FlSpot> spots = [];
    data[i].data.forEach((key, value) {
      if (value is double) { // Check if the value is a double
        spots.add(FlSpot(double.parse(key), value));
      } else {
        print('Invalid value: $value at key: $key');
      }
    });

    linesData.add(
      LineChartBarData(
        spots: spots,
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: false),
      ),
    );
  }
  return linesData;
}
}
class TableData extends StatelessWidget {
  final List<Map<String, dynamic>> jsonData;

  TableData({required this.jsonData});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        
        scrollDirection: Axis.horizontal,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                showCheckboxColumn: true,
                showBottomBorder: true,
                dataRowColor: MaterialStatePropertyAll(Color.fromARGB(255, 238, 237, 237)),
                headingTextStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                border: TableBorder.all(borderRadius: BorderRadius.circular(5)),
                dataTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                columns: _buildColumns(jsonData.first.keys.toList()),
                rows: _buildRows(jsonData),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataColumn> _buildColumns(List<String> keys) {
    List<DataColumn> columns = [];
    for (var key in keys) {
      columns.add(DataColumn(label: Text(key)));
    }
    return columns;
  }

  List<DataRow> _buildRows(List<Map<String, dynamic>> data) {
    List<DataRow> rows = [];
    for (var i = 0; i < data.length; i++) {
      List<DataCell> cells = [];
      data[i].forEach((key, value) {
        cells.add(DataCell(Text(value.toString())));
      });
      rows.add(DataRow(cells: cells));
    }
    return rows;
  }
}


class LineChartPage extends StatefulWidget {
  @override
  _LineChartPageState createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'), // Replace 'your_json_data.json' with the path to your JSON file
          builder: (context, snapshot) {
            var jsonData = json.decode(snapshot.data.toString());
            if (jsonData == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return LineChart(
              lineChartData(jsonData),
            );
          },
        ),
      ),
    );
  }
}


// LineChartData lineChartData(Map<String, dynamic> jsonData) {
//   List<FlSpot> spots = [];
//   List<String> years = [];
//   for (var data in jsonData) {
//     years.add(data['Year'].toString());
//     double total = 0;
//     int count = 0;
//     data.forEach((key, value) {
//       if (key != 'Year') {
//         total += value;
//         count++;
//       }
//     });
//     spots.add(FlSpot(double.parse(data['Year'].toString()), total / count));
//   }
//   return LineChartData(
//     lineBarsData: [
//       LineChartBarData(
//         spots: spots,
//         isCurved: true,
//         barWidth: 2,
//         color: 
//           Colors.blue,
        
//         belowBarData: BarAreaData(show: false),
//         dotData: FlDotData(show: false),
//       ),
//     ],
//     titlesData: FlTitlesData(
//       bottomTitles: AxisTitles(sideTitles:  SideTitles(
//         showTitles: true,
//         getTitlesWidget: (value, meta) 
          
//          {
//           int index = value.toInt();
//           if (index >= 0 && index < years.length) {
//             return Text(years[index]);
//           }
//           return Text("");
//         },
//       )),
//       leftTitles: AxisTitles(
//         sideTitles:SideTitles(showTitles: true) ),
//     ),
//     borderData: FlBorderData(show: true),
//     minX: 2000,
//     maxX: 2023, // Change this to the maximum year in your data
//     minY: 0,
//     maxY: 500000, // Adjust this according to your data
//   );
// }

LineChartData lineChartData(List<Map<String, dynamic>> countryDataList) {
  List<LineChartBarData> lines = [];
  List<String> years = [];
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ]; // Add more colors as needed

  int colorIndex = 0;
  for (var countryData in countryDataList) {
    List<FlSpot> spots = [];
    for (var data in countryData['data']) {
      years.add(data['Year'].toString());
      double total = 0;
      int count = 0;
      data.forEach((key, value) {
        if (key != 'Year') {
          total += value;
          count++;
        }
      });
      spots.add(FlSpot(double.parse(data['Year'].toString()), total / count));
    }

    lines.add(LineChartBarData(
      spots: spots,
      isCurved: true,
      barWidth: 2,
      color: colors[colorIndex], // Assign unique color to each country
      belowBarData: BarAreaData(show: false),
      dotData: FlDotData(show: false),
    ));

    colorIndex++;
  }

  return LineChartData(
    lineBarsData: lines,
    titlesData: FlTitlesData(
      bottomTitles: AxisTitles(sideTitles:  SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) 
          
         {
          int index = value.toInt();
          if (index >= 0 && index < years.length) {
            return Text(years[index]);
          }
          return Text("");
        },
      )),
      leftTitles: AxisTitles(
        sideTitles:SideTitles(showTitles: true) ),
    ),
    borderData: FlBorderData(show: true),
    minX: 2000,
    maxX: 2023, // Change this to the maximum year in your data
    minY: 0,
    maxY: 500000, // Adjust this according to your data
  );
}


