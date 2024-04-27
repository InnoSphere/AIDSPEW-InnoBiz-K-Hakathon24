import 'package:flutter/material.dart';
import 'package:malaria_prediction/responsive.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Responsive.isDesktop(context)?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/service3.jpg",height: 180,width: 180,),
                      Text("Malaria Incidence Analytics and Outbreak Prediction", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(221, 7, 1, 50)),),
                      Text("Our malaria outbreak warning service utilizes predictive modeling to forecast outbreaks up to four months in advance, enabling proactive planning and resource allocation. Customizable alerts, risk assessments, and continuous monitoring empower stakeholders to take early action, optimize resources, and engage communities in malaria prevention efforts, contributing to the global goal of malaria elimination.",                              
                          style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/service1.jpg",height: 180,width: 180),
                      Text("Enhanced Climate Prediction", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(221, 7, 1, 50)),),
            
                      Text(
                          "We provide high-precision  malaria-critical climate prediction.",
                          
                          style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                 Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/service2.jpg",height: 180,width: 180),
                       Text("Malaria Outbreak Early Warning", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(221, 7, 1, 50)),),
            
                      Text("We offer early malaria outbreak warning based on malaria prediction results at least 4 months ahead.",                              
                          style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
               
              ],
            ):
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: 
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/service3.jpg",height: 180,width: 180),
                      Text("Malaria Incidence Analytics and Outbreak Prediction", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(221, 7, 1, 50)),),
                      Text("We provide high-tech, high-precision malaria incidence analytics, and outbreak prediction.",                              
                          style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/service1.jpg",height: 180,width: 180),
                      Text("Enhanced Climate Prediction", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(221, 7, 1, 50)),),
            
                      Text(
                          "We provide high-precision  malaria-critical climate prediction.",
                          
                          style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                 Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/service2.jpg",height: 180,width: 180),
                       Text("Malaria Outbreak Early Warning", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(221, 7, 1, 50)),),
            
                      Text("We offer early malaria outbreak warning based on malaria prediction results at least 4 months ahead.",                              
                          style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
               
              ],
            )
            ),
          
          ),
        ),
      ),
    );
  }
}
