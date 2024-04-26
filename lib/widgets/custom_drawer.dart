import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/routes/routes.dart';

class CustomEndDrawer extends StatefulWidget {
  const CustomEndDrawer({super.key});

  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profiles/faisal.png'),
                ),
                GestureDetector(
                  onTap: () => Scaffold.of(context).closeEndDrawer(),
                  child: const Icon(
                    CupertinoIcons.clear,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          drawerItems(
            title: 'Home',
            onTap: () => Navigator.pushNamed(context, Routes.home),
          ),
          drawerItems(
            title: 'Playground',
            onTap: () => Navigator.pushNamed(context, Routes.playground),
          ),
          drawerItems(
            title: 'Services',
            onTap: () => Navigator.pushNamed(context, Routes.services),
          ),
          drawerItems(
            title: 'Case Studies',
            onTap: () => Navigator.pushNamed(context, Routes.caseStudies),
          ),
          drawerItems(
            title: 'About Me',
            onTap: () => Navigator.pushNamed(context, Routes.about),
          ),
          drawerItems(
            title: 'Contact',
            onTap: () => Navigator.pushNamed(context, Routes.contact),
          ),
        ],
      ),
    );
  }

  Widget drawerItems({
    required String title,
    required Function() onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 22, color: Colors.black87),
        ),
        onTap: onTap,
      ),
    );
  }
}
