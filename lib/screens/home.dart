import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/controller/home_controller.dart';
import 'package:osar_pasar/screens/service_providers.dart';
import 'package:osar_pasar/utils/colors.dart';
import 'package:osar_pasar/widgets/drawer.dart';

import '../widgets/home_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff00183F),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shadowColor: Color.fromARGB(255, 243, 243, 243),
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Goodmorning, User",
                  style: textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  ),
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 20,
                  //   color: Color(0xff00183F),
                  // ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeCard(
                    text: "Home Move",
                    iconData: Icons.home_filled,
                    onTap: (() => Get.to(() => ServiceProviderScreen())),
                  ),
                  // iconData: Icons.home_filled,
                  //iconData: FontAwesomeIcons.houseChimney,
                  HomeCard(
                    text: "Office Move",
                    iconData: Icons.label_important_rounded,
                    onTap: (() => Get.to(() => ServiceProviderScreen())),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor,
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.1), BlendMode.dstATop),
                        fit: BoxFit.fitWidth,
                        image: const NetworkImage(
                            "https://www.thepackersmovers.com/images/packers-movers-charges-banner.jpg",
                            scale: 2),
                      ),
                    ),
                    height: 180,
                    width: 350,
                    child: Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10.0,
                        children: const [
                          Text(
                            "Enjoy 10% off as a first mover",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            // Icons.directions_car_filled,
                            // Icons.delivery_dining,
                            FontAwesomeIcons.percent,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff00183F),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      splashColor: Colors.grey.withOpacity(0.1),
                      child: Container(
                        height: 104,
                        width: 163,
                        child: Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10.0,
                            children: const [
                              Icon(
                                Icons.history,
                                color: Colors.white,
                              ),
                              Text(
                                "History",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff00183F),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      splashColor: Colors.grey.withOpacity(0.1),
                      child: Container(
                        height: 104,
                        width: 163,
                        child: Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10.0,
                            children: const [
                              Icon(
                                FontAwesomeIcons.receipt,
                                color: Colors.white,
                              ),
                              Text(
                                "Active Bookings",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFC533),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.1), BlendMode.dstATop),
                          fit: BoxFit.cover,
                          image: const NetworkImage(
                              "http://blog.quikr.com/wp-content/uploads/2016/06/hire-movers-and-packers.png",
                              scale: 2),
                        ),
                      ),
                      height: 180,
                      width: 350,
                      child: Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10.0,
                          children: const [
                            Text(
                              "Scratchless Shifting",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              // Icons.directions_car_filled,
                              // Icons.delivery_dining,
                              FontAwesomeIcons.peopleCarryBox,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
