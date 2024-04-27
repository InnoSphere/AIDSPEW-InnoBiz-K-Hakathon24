// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malaria_prediction/main.dart';
import 'package:malaria_prediction/responsive.dart';
import 'package:malaria_prediction/widget/aboutUs.dart';
import 'package:malaria_prediction/widget/controller_page.dart';

// import 'controller_page.dart';
// import 'aboutUs.dart';
// import 'cultivate_page.dart';

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Menu({super.key, required this.scaffoldKey});

  @override
  _MenuState createState() => _MenuState();
}

//menu page widgets..
class _MenuState extends State<Menu> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/home.svg', title: "Dashboard"),
    MenuModel(icon: 'assets/svg/remote.svg', title: "Services"),
    //I just remove some stuff in this code that I think it will not needed soon.
    //MenuModel(icon: 'assets/svg/share-2.svg', title: "Connect"),
    // MenuModel(icon: 'assets/svg/bell.svg', title: "About us"),
    // MenuModel(icon: 'assets/svg/history.svg', title: "our client"),
    // MenuModel(icon: 'assets/svg/setting.svg', title: "Contact Us"),
    MenuModel(icon: 'assets/svg/profile.svg', title: "About Us"),
    // MenuModel(icon: 'assets/svg/slack.svg', title: "Cultivate"),
    // MenuModel(icon: 'assets/svg/signout.svg', title: "Exit"),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Color.fromARGB(255, 247, 245, 245)!,
              width: 1,
            ),
          ),
          color: const Color(0xFF171821)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? 40 : 80,
            ),
            for (var i = 0; i < menu.length; i++)
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  color: selected == i
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selected = i;
                    });
                    widget.scaffoldKey.currentState!.closeDrawer();

                    // Navigate to the corresponding page
                    switch (i) {
                      case 0: // Dashboard
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                        );
                        break;
                      case 1: // Controller
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ControllerPage()),
                        );
                        break;
                      // Add similar cases for other menu items
                      // case 2: //Notification
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (context) => const NotificationPage()),
                      //   );
                        // break;
                      // case 3: //History
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (context) => const HistoryPage()),
                      //   );
                      //   break;
                      // case 4: //Settings
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (context) => const SettingsPage2()),
                      //   );
                      //   break;
                      case 2: //About Us
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const AboutUsPage()),
                        );
                        break;
                      // case 4: //Cultivate Crops
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (context) => const CultivatePage()),
                      //   );
                      //   break;
                      // case 7: //Exit
                      //   SystemNavigator.pop();
                      //close the application
                    }
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 7),
                        child: SvgPicture.asset(
                          menu[i].icon,
                          color: selected == i ? Colors.black : Colors.grey,
                        ),
                      ),
                      Text(
                        menu[i].title,
                        style: TextStyle(
                            fontSize: 16,
                            color: selected == i ? Colors.black : Colors.grey,
                            fontWeight: selected == i
                                ? FontWeight.w600
                                : FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
          ],
        )),
      ),
    );
  }
}
//components should works well in different platforms.
//add connection to firebase.
//Merry Christmas
class MenuModel {
  String icon;
  String title;
  MenuModel({required this.icon, required this.title});
}
