import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/image_path.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  //bottomRight: Radius.circular(20),
                  //bottomLeft: Radius.circular(20)),),
                  ),
              color: Color(0xff00183F),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: 'https://picsum.photos/100/100',
                    errorWidget: (context, url, error) => Image.asset(
                      ImagePath.on_board3,
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                    ),
                    // height: 87,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(
                    child: Text(
                      "Shishir Acharya",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerItem(
                  icon: Icons.person,
                  label: 'Profile',
                  onPressed: () => Get.back(),
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.support_agent,
                  label: 'Support',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.bookmark_add,
                  label: 'Active Bookings',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.history,
                  label: 'Pending Requests',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.info,
                  label: 'About',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.question_answer,
                  label: 'FAQ',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xff00183F),
          ), //icon color
          const SizedBox(width: 20),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
