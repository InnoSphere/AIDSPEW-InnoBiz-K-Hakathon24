import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartExample extends StatefulWidget {
  LineChartExample();
// int selectedValue;
  @override
  _LineChartExampleState createState() => _LineChartExampleState();
}

class _LineChartExampleState extends State<LineChartExample> {
  final List<Color> lineColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lime,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lime,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lime,
    Colors.pink,
    Colors.brown,
    Colors.grey,
  ];

  Map<String, List<double>> dataMap = {};

  @override
  void initState() {
    super.initState();
    // Parse JSON data
    String jsonData =
        '{"Year":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021],"DRC":[469523.7312,469834.14,470338,474509.3,481241.6,481689.06,473914.06,464055.1,444963.44,413967.25,389912.72,365719.06,345523.96,326492.1,307504.6598,295763.5393,297480.5387,308210.4085,320878.8742,320674.6876,324207.4264,318252.5254],"Ethiopia":[329440.4088,231740.75,205862.85,217671.04,222274.54,152039.25,141754,121483.73,100637.29,135903.76,155283.39,155215.23,174578.54,191606.49,211412.4825,179794.8789,124615.6165,89714.22708,36964.23483,34086.65926,53052.4727,46262.16384],"Nigeria":[413334.9609,407761.84,392939.24,391655.12,401153.66,407785.46,410961.43,412435.03,413092.5,400175.75,373258.73,350502.35,328053.77,308184.72,298158.9574,294110.6555,295056.1319,299073.6848,300685.3412,301908.1437,312650.9355,306462.4837],"Uganda":[487225.5193,507974.4,500152.56,484124.7,449824.68,433645.3,421310.4,415413.54,417960.7,423051.33,409436.65,394679.72,376555.97,332344.42,294282.3828,253514.7797,283137.1325,294903.2599,262691.5805,262691.5582,283817.5292,284020.1845],"Rwanda":[189410.2446,238604.08,190429.61,151754.55,129912.9,157407.5,154461.7,90638.435,71778.96,158100.42,107553.406,37947.96,61270.744,112345.07,202236.9626,307959.7721,409678.7677,709793.3263,493474.7644,411334.1241,227138.6563,126319.0572],"Kenya":[221627.2955,241661.36,223487.61,209224.9,178076.83,136533.55,103497.68,79708.37,66336.8,62768.92,64019.06,65881.06,68789.566,71349.55,72269.56774,70845.77549,66636.76494,64468.97181,61418.60006,59616.38225,63521.00517,64515.76754],"Algeria":[18.80842,3.2477,5.344253,2.63825,1.041484,0.513554,0.506054,12.954872,1.470534,0,0.47319,0.464362,25.046336,3.570869,0,0,0,0,0,0,0,0],"Benin":[412446.3438,432801.73,448662.32,460236.97,479133.48,486095.03,485586.46,482004.06,467394.35,442717.5,416378.1,387120.1,365442,359516.63,369022.7572,389707.2685,419330.2271,420503.3139,408066.8585,401714.7794,378154.2741,383450.6626],"Burkina Faso":[599317.3545,601937.74,595852.05,585123.3,562411.3,533845.1,518073.7,526309.6,555743.47,571970.9,571289.2,557088,534152.5,487199.07,447606.3688,419282.1142,374321.12,357614.1753,357025.6235,356663.2493,377402.1349,376771.823],"Cabo Verde":[1208.611356,944.54545,659.90555,581.29597,379.04313,564.8404,655.8237,145.72893,279.95744,513.7,366.93808,53.969454,7.612552,165.34889,183.125674,48.759081,337.507404,2879.745112,13.466925,0,0,0], "Cameroon":[406436.9211,407103.24,401988.07,416466.2,433275.54,431844.85,419129.03,399788.1,363447.78,315464.1,290870.33,268442.87,258028.6,262103.4,261237.1155,260553.9146,258387.5086,252173.5174,247997.0688,242260.749,249184.556,245084.3109],"Chad":[270008.4635,268382.45,233840.5,228381.48,221909.68,223130.5,225949.51,226153.98,227219.15,233784.09,233518.37,217642.47,202390.32,190393.08,190798.992,191757.0118,194865.7015,198494.6118,208387.057,205511.5553,208562.109,206362.1958], "Djibouti":[3110.707771,3404.4452,3405.4923,3404.5525,3404.9914,3405.2138,3405.4768,3404.0885,4326.6892,1602.9787,3405.271,3405.3626,2542.2666,0,12725.5691,12553.45455,18012.33575,18806.78023,31337.78079,61337.77994,88476.37209,70493.97041],"Equatorial Guinea":[311165.1924,389037.17,388943.9,392427.22,394424.16,396479.37,392603.4,385915.07,358819.7,327205.63,312497.34,310305.08,328211.76,347711.67,306633.1167,301477.4609,283986.2266,262169.6926,240036.0564,223756.641,220866.6526,213175.4347],"Gabon":[330432.4259,274964.87,231662.5,177577.29,142307.72,120266.21,109870.19,117102.104,142849.4,172402,201087,226082.87,241242.22,0,240592.2145,233621.4091,228331.2386,228144.8359,227907.9677,228369.6386,230208.1548,228918.421],"Ghana":[431104.0725,419930.4,391170.44,370895.57,352265.35,336385.35,327993.93,328589.3,342200.04,359731.02,371745.8,376216.37,366070.9,341490.1,314491.751,277094.7534,235272.1282,198252.0369,172154.6751,166318.31,165119.3894,164366.544],"Guinea":[445022.3,442745.85,426085.75,404383.06,370855.65,343663.1,333324.98,336532.93,356185.9,384619.75,406750.85,421860.1,429742.8,414739.87,398850.77,382216.6,360813.3,353731.2,349269.23,327849.85,319538.3,0], "Guinea-Bissau":[403486.5365,330873.08,260890.38,192067.78,127456.43,94827.17,77351.48,75471.91,88403.36,107594.75,124625.4,127885.8,121288.666,111831.94,107017.1725,90222.64284,75851.76108,65054.42525,65275.81164,74594.87824,94108.72356,105080.6975],"Liberia":[431193.9249,458751.53,445245.8,430274.72,408658.3,393495.7,381049.74,374855.68,372161.87,354199.86,337396.45,327004.03,313729.22,322260.93,333307.6662,345111.331,376951.6438,404325.4526,402138.0168,392020.603,376225.9257,356687.968],"Madagascar":[55868.45836,68353.77,53594.303,68294.61,46853.584,36148.884,35302.63,22754.91,23472.687,42919.884,42244.48,37874.317,71357.124,65209.49,44527.6292,94400.88155,55231.13144,75329.6332,71569.85593,73836.89049,142090.7703,169848.9455],"Mali":[406229.3997,407446.47,416458.28,423808.87,429372.6,431240.26,405710.33,388805.5,379058.75,374562.32,383603.42,404732.94,435650.57,452815.95,441007.3855,391829.31,384221.8129,386777.5536,386777.5323,333695.4362,357450.2332,353560.4492], "Mozambique":[473696.435,501871.37,500468.7,483082.24,452064.1,415132.14,395606.05,382648.65,379233.7,375631.96,371804.93,368025.63,367055.05,366406,357773.0674,350309.8694,343058.0306,329826.7309,319688.0438,311086.2008,320430.9801,320600.3964], "Namibia":[53608.76433,71087.746,47899.387,45297.997,69666.09,42444.84,43570.374,12973.795,7456.53,4916.989,1539.9635,1806.2024,3138.1593,4424.5267,14480.03855,8307.320067,17380.27069,47502.51485,26298.39728,2937.658308,10253.47202,10616.90269], "Senegal":[275808.7225,273644.5,223620.13,202761.29,138998.06,125264.34,121269.02,99267.33,52376.65,32890.957,60474.945,48897.583,53267.76,61783.157,38136.73972,70417.68281,46377.36355,53153.58245,67265.81837,42011.7618,50830.42713,59002.16393], "South Africa":[3889.069037,5816.384,3390.8324,2880.829,2833.2722,1619.6542,2494.975,1288.0763,1566.1077,1202.9239,1573.6974,1897.1709,1253.2021,1610.2558,2138.698381,887.492953,766.186827,4127.913957,1667.607552,829.961239,758.988822,498.044779], "Sudan":[92771.44775,86352.7,66654.045,61088.78,55374.05,54651.62,52678.52,46513.82,38635.31,34629.757,32729.385,32562.878,33065.29,34939.293,38572.7577,42212.43079,53259.8186,53776.50478,59189.02968,65590.86073,73398.37798,72844.47501], "Tanzania":[350309.5605,328419.1,302445.98,283714.7,267095.83,248378.39,226712.94,198626.19,171066,151103.9,137373.15,127433.784,124638.92,134518.52,143015.3709,140513.2507,131452.599,124466.7392,117963.4296,117591.2747,123244.6181,125773.2393],"Zambia":[397111.4663,404154,371453.9,348523.65,301793.46,258448.36,222493.12,193436.78,172559.88,165219.04,168475.48,180511.95,200348.59,227613.46,232318.5773,219322.7439,205968.7417,185247.2183,178839.6812,174398.6938,186898.6196,187721.2356],"Zimbabwe":[105924.3522,113032.78,113032.82,113032.875,113032.79,113032.87,113032.82,175120.47,74725.73,90145.05,109793.71,70678.23,57218.678,81951.61,100185.1079,95740.44595,66836.20304,115181.9371,53551.42073,64739.37839,93437.66508,27199.48304],"Togo":[443669.8226,441940.67,444376.62,453683.04,465799.04,461287.02,445598.14,422672.94,378966.13,335355.56,318571.93,316851.32,341313.96,367162.1,368830.7818,357204.2286,324818.3024,277513.0384,250338.6801,238580.0768,242752.6893,237522.9169],"South Sudan":[367164.3173,357181.4,336607.54,318788.33,306663.02,305748.4,305231.66,299469.97,293152.56,286080.32,285696.44,290857.97,287800.3,285738.34,276305.4101,271000.6489,266547.8577,277783.6843,278790.6512,281258.8986,286886.613,274796.0612],"Somalia":[134990.3944,125960.53,126188.16,120998.38,119991.4,136564.24,120067.68,100563.156,63099.335,38436.584,43701.538,35612.74,35715.99,41761.215,50252.3248,58977.73495,58594.62429,55197.24175,59288.19849,59883.42625,56048.62449,66326.01998],"Sierra Leone":[454087.6039,473005.34,465025.36,444057.3,428588.17,408435.1,392090.2,397634.86,425290.92,447064.15,448070.92,441330.02,429628.33,414096.92,401645.1916,390650.9471,388955.1427,375637.979,369071.1476,355119.4334,339547.873,329831.6601],"Niger":[355745.0894,353206.24,327129.52,294673.55,299261.84,307459.56,304839.17,313594.9,352145.87,379545.56,414348.14,428117.58,429718.6,416625.1,406812.5803,401109.6613,384937.6993,362654.0752,343726.8044,325529.3005,322408.9368,323385.6928],"Mauritania":[113082.2489,159007.25,124171.69,118745.255,92541.08,84204.8,74070.95,71022.995,60889.13,31113.56,35214.07,45153.095,22934.774,24649.921,56382.30275,73913.51724,95341.68006,73671.60936,55373.67071,41985.25086,44851.91406,18424.80586],"Malawi":[451335.5894,465235.63,437955.32,398393.83,369799,363373.38,350059.78,348560.85,365887.3,380744.23,379391.63,364943.66,320182.3,287102.26,264187.0362,242436.8063,226907.0618,218759.4792,210122.1349,204964.1772,219467.2979,219166.141],"Gambia":[312459.6967,361466.67,350238.53,339536.87,329345.86,319603.94,310220.8,301111.82,292223.7,283543.95,275087.16,256405.6,275058,292698.3,138747.5394,199934.4912,128196.6299,62177.94356,80231.79528,43834.24815,81933.72559,80802.19219],"Eritrea":[17849.20263,22933.641,13229.431,19027.502,5549.287,9792.5005,5632.907,12537.127,6780.437,8864.33,26327.917,23857.729,16148.098,15026.575,33004.80679,19167.63024,25721.72893,34127.25538,28941.99585,57271.34135,44625.95349,25660.21934],"Cote d\'Ivoire":[496975.0596,521945.7,523078.1,521565.37,515900.27,486077.94,475741.76,471286.16,477930.82,485252.9,481861.7,466612.03,382510.38,294249.57,258993.6943,239805.5833,242342.8432,250687.3788,264020.4428,274750.5388,275941.3676,270874.111],"CongoRep":[353415.5704,351275.5,319893.28,314456.33,308728.36,287134.03,263654.82,241406.68,219018.04,206185.65,201133.3,198482,195691.68,193949.19,213122.6742,210902.9604,217142.899,233140.0099,242959.7384,237739.9886,228694.3541,219343.6519], "Comoros":[66331.56842,63564.163,62068.905,60607.36,59176.533,57773.964,56402.424,55060.284,53748.554,52464.832,52976.963,35177.998,68852.615,71686.06,3082.791781,1780.295146,1531.695237,4240.715066,19561.69741,22249.44563,5639.037121,12824.58543],"Central African Republic":[441964.2673,433936.34,434425.02,438873.96,446471.28,444805.85,440104.68,432304.96,422806.1,409576.84,395601.78,385812,377724.9,371190.28,362654.7908,346442.8574,334120.2988,328699.3995,324667.2203,322872.7515,335994.471,334707.6611], "Burundi":[448439.5875,468937.77,430575.8,383650.33,331545.5,292635.96,261978.88,223522.83,197282.49,174827.85,169315.2,164904.45,164608.63,170304.15,182626.8593,199915.2058,231692.8585,250531.7288,288499.5935,298872.1194,303437.8167,291444.7392], "Botswana":[16722.03997,6933.4173,3241.1914,1619.3234,1039.715,1229.0903,3944.389,1039.0939,1934.603,2099.4065,1691.9549,510.41293,224.82197,529.4604,1385.30773,297.719923,631.570578,1841.907445,497.158872,156.28281,1051.999955,621.768784], "Angola":[325703.6072,326650.7,309120.94,313731,313732.57,316022.13,301362.95,274332.7,233454,196812.68,172719.06,157172.76,154216.32,160698.35,166779.6696,176683.5411,189452.1768,208948.763,214247.2131,227253.733,251582.3214,254873.1171],"Cape":[1293.4984,944.54545,659.90555,581.29597,379.04313,564.8404,655.8237,145.72893,279.95744,513.7,366.93808,53.969454,7.612552,165.34889,192.94848,51.30761,347.58428,3026.8552,14.146472,0,0,0]}';
    // '{"Year":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021],"DRC":[469523.7312,469834.14,470338,474509.3,481241.6,481689.06,473914.06,464055.1,444963.44,413967.25,389912.72,365719.06,345523.96,326492.1,307504.6598,295763.5393,297480.5387,308210.4085,320878.8742,320674.6876,324207.4264,318252.5254],"Ethiopia":[329440.4088,231740.75,205862.85,217671.04,222274.54,152039.25,141754,121483.73,100637.29,135903.76,155283.39,155215.23,174578.54,191606.49,211412.4825,179794.8789,124615.6165,89714.22708,36964.23483,34086.65926,53052.4727,46262.16384]}';

    // Decode JSON data
    Map<String, dynamic> parsedData = jsonDecode(jsonData);

    // Convert dynamic values to double
    parsedData.forEach((key, value) {
      dataMap[key] = List<double>.from(value.map((e) => e.toDouble()));
      dataMap["DRC"];
    });
  }

  List<int> options = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47
  ];
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          print(dataMap.length.toString() + "drc");
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Malaria Incidence",
              //   style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.red),
              // ),
              DropdownButton<int>(
                // Set the currently selected value
                value: selectedValue,

                // List of DropdownMenuItem objects
                items: options
                    .map((int value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text(value==0?'Top Countries':value==1?'Democratic Republic of Congo':value==2?'Ethiopia':value==3?'Nigeria':value==4?'Uganda':value==5?'Rwanda':value==6?'Kenya':value==7?'Algeria':value==8?'Benin':value==9?'Burkina Faso':value==10?'Cabo Verde':value==11?'Cameroon':value==12?'Chad':value==13?'Djibouti':value==14?'Equatorial':value==15?'Guinea':value==16?'Gabon':value==17?'Ghana':value==18?'Guinea':value==19?'Guinea-Bissau':value==20?'Liberia':value==21?'Madagascar':value==22?'Mali':value==23?'Mozambique':value==24?'Namibia':value==25?'Senegal':value==26?'South Africa':value==27?'Sudan':value==28?'Tanzania':value==29?'Zambia':value==30?'Zimbabwe':value==31?'Togo':value==32?'South Sudan':value==33?'Somalia':value==34?'Sierra Leone':value==35?'Niger':value==36?'Mauritania':value==37?'Malawi':value==38?'Gambia':value==39?'Eritrea':value==40?"Cote d'Ivoire":value==41?'Congo, Rep.':value==42?'Comoros':value==43?'Central African Republic':value==44?'Burundi':value==45?'Botswana':'Angola' ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                        ))
                    .toList(),

                // Function called when a new value is selected
                onChanged: (int? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
              Container(
                height: 400,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      for (var i = 1; selectedValue ==0?i < 5:i<2; i++)
                        LineChartBarData(
                          spots: [
                            for (var j = 0; j < dataMap['Year']!.length; j++)
                              FlSpot(dataMap['Year']![j].toDouble(),
                                  dataMap.values.elementAt(selectedValue==0?i:selectedValue)[j]),
                          ],
                          isCurved: true,
                          color: lineColors[i],
                          barWidth: 3,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(show: false),
                        ),
                    ],
                    minY: 0,
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          // getTextStyles: (context, value) =>
                          //     const TextStyle(color: Colors.black, fontSize: 12),
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 2000:
                                return Text('2000',style: TextStyle(color: Colors.black),);
                              case 2005:
                                return Text('2005',style: TextStyle(color: Colors.black),);
                              case 2010:
                                return Text('2010',style: TextStyle(color: Colors.black),);
                              case 2015:
                                return Text('2015',style: TextStyle(color: Colors.black),);
                              case 2020:
                                return Text('2020',style: TextStyle(color: Colors.black),);
                              default:
                                return Text("");
                            }
                          },
                        ),
                      ),

                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          // getTextStyles: (context, value) =>
                          //     const TextStyle(color: Colors.black, fontSize: 12),
                          getTitlesWidget: (value, meta) {
                            return Text('${value ~/ 1000}k');
                          },
                        ),
                      ),
                      // borderData: FlBorderData(
                      //   show: true,
                      //   border: Border.all(color: Colors.black, width: 1),
                      // ),
                      // gridData: FlGridData(
                      //   show: true,
                      //   horizontalInterval: 100000,
                      //   getDrawingHorizontalLine: (value) {
                      //     return FlLine(
                      //       color: Colors.black12,
                      //       strokeWidth: 1,
                      //     );
                      //   },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
