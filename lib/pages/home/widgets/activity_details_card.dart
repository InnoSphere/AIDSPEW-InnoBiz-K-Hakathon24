import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malaria_prediction/model/health_model.dart';
import 'package:malaria_prediction/responsive.dart';
import 'package:malaria_prediction/widget/custom_card.dart';

class ActivityDetailsCard extends StatelessWidget {
   ActivityDetailsCard({super.key});

  final List<HealthModel> healthDetails = const [
    HealthModel(
        icon: 'assets/svg/thermometer.svg',
        value: "608 K",
        title: "World death in 2022"),
    HealthModel(icon: 'assets/svg/soil.svg', value: "249 M", title: "World Malaria Incidence"),
    HealthModel(
        icon: 'assets/svg/soil.svg',
        value: "233 M",
        title: "African Incidence"),
    HealthModel(
        icon: 'assets/svg/thermometer.svg', value: "580 K", title: "African Death"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: healthDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(healthDetails[i].icon),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  healthDetails[i].value,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                healthDetails[i].title,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
      },
    );
  }
}
