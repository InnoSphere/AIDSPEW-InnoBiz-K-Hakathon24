// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malaria_prediction/pages/home/graphpage.dart';
import 'package:malaria_prediction/pages/home/widgets/activity_details_card.dart';
import 'package:malaria_prediction/responsive.dart';
import 'package:malaria_prediction/service/graph_malaria.dart';

import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({super.key, required this.scaffoldKey});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<DataModel>> fetchData(BuildContext context) async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => DataModel.fromJson(json)).toList();
  }

  bool table = false;
  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              // Header(scaffoldKey: widget.scaffoldKey),
              _height(context),
              ActivityDetailsCard(),
              _height(context),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Malaria Incidence",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  TextButton.icon(
                      onPressed: () {
                        if (table) {
                          setState(() {
                            table = false;
                          });
                        } else {
                          setState(() {
                            table= true;
                          });
                        }
                      },
                      icon: Icon(table? Icons.auto_graph:Icons.table_chart),
                      label: Text(table?"graph":"Table")),
                 
                  // SizedBox(
                  //   width: 20,
                  // ),
                  
                ],
              ),
              table?
              Container(
                height: 400,
                width: 700,
                child: FutureBuilder(
                  future: loadJsonData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error loading data');
                    } else {
                      return TableData(jsonData: snapshot.data!.toList());
                    }
                  },
                ),

                    ):
              Container(height: 500, child: LineChartExample()),

              //       FutureBuilder<List<DataModel>>(
              //   future: fetchData(context),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return ChartWithData(snapshot.data!);
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     }
              //     return CircularProgressIndicator();
              //   },
              // ),
              // LineChartCard(),
              

              _height(context),
              // BarGraphCard(),
              _height(context),
            ],
          ),
        )));
  }

  Future<List<Map<String, dynamic>>> loadJsonData() async {
    String jsonData =
        await rootBundle.loadString('assets/data.json'); // Load the JSON file
    List<dynamic> jsonList = json.decode(jsonData); // Decode JSON data
    return jsonList.cast<Map<String, dynamic>>();
  }
}


// class LineChartPage extends StatefulWidget {
//   @override
//   _LineChartPageState createState() => _LineChartPageState();
// }

// class _LineChartPageState extends State<LineChartPage> {
//   List<charts.Series> seriesList;

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   _loadData() async {
//     String jsonString = await rootBundle.loadString('assets/data.json');
//     List<dynamic> jsonData = json.decode(jsonString);

//     List<DataPoint> data = [];
//     for (var item in jsonData) {
//       data.add(DataPoint(item['Year'], item['DRC']));
//     }

//     setState(() {
//       seriesList = [
//         charts.Series<DataPoint, int>(
//           id: 'DRC',
//           colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//           domainFn: (DataPoint sales, _) => sales.year,
//           measureFn: (DataPoint sales, _) => sales.value,
//           data: data,
//         )
//       ];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Line Chart Example'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: seriesList == null
//             ? Center(child: CircularProgressIndicator())
//             : charts.LineChart(
//                 seriesList,
//                 animate: true,
//                 defaultRenderer: charts.LineRendererConfig(
//                   includeArea: true,
//                   stacked: true,
//                 ),
//                 behaviors: [
//                   charts.ChartTitle('Year',
//                       behaviorPosition: charts.BehaviorPosition.bottom,
//                       titleOutsideJustification:
//                           charts.OutsideJustification.middleDrawArea),
//                   charts.ChartTitle('Population',
//                       behaviorPosition: charts.BehaviorPosition.start,
//                       titleOutsideJustification:
//                           charts.OutsideJustification.middleDrawArea),
//                 ],
//               ),
//       ),
//     );
//   }
// }

// class DataPoint {
//   final int year;
//   final double value;

//   DataPoint(this.year, this.value);
// }