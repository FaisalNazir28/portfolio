import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/services/authentication.dart';
import 'package:my_portfolio/widgets/date_time.dart';
import 'package:my_portfolio/widgets/header_menu_buttons.dart';

class CustomHeader extends StatefulWidget implements PreferredSizeWidget {
  const CustomHeader({super.key});

  @override
  State<CustomHeader> createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _HeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return AppBar(
      surfaceTintColor: Colors.white,
      toolbarHeight: 100,
      leading: Padding(
          padding: EdgeInsets.only(
              left: isDesktopScreen
                  ? MediaQuery.of(context).size.width * .2
                  : isTabletScreen
                      ? MediaQuery.of(context).size.width * .1
                      : MediaQuery.of(context).size.width * .04),
          // padding: EdgeInsets.only(
          //     left: isDesktopScreen
          //         ? 200
          //         : isTabletScreen
          //             ? 100
          //             : 50),
          child:
              // Icon(Icons.blur_circular_rounded, size: 50,)
              // Icon(Icons.border_vertical_sharp, size: 50,)
              // Icon(Icons.bubble_chart_rounded, size: 50,)
              // Icon(Icons.currency_franc_outlined, size: 50,)
              // Icon(Icons.drag_indicator_outlined, size: 50,)
              // Icon(Icons.format_overline_rounded, size: 50,)
              const Icon(
            Icons.superscript_sharp,
            size: 50,
          )),
      title: Padding(
        padding: EdgeInsets.only(
            left: isDesktopScreen
                ? MediaQuery.of(context).size.width * .2
                : isTabletScreen
                    ? MediaQuery.of(context).size.width * .1
                    : MediaQuery.of(context).size.width * .04),
        // padding: EdgeInsets.only(
        //     left: isDesktopScreen
        //         ? 200
        //         : isTabletScreen
        //         ? 100
        //         : 50),
        child: Row(
          children: [
            if (!isMobileScreen)
              Row(
                children: [
                  HeaderButton(
                      title: "Home",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.home);
                      }),
                  HeaderButton(
                      title: "Playground",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.playground);
                      }),
                  HeaderButton(
                      title: "Services",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.services);
                      }),
                  HeaderButton(
                      title: "Case Studies",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.caseStudies);
                      }),
                  HeaderButton(
                      title: "About Me",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.about);
                      }),
                  HeaderButton(
                      title: "Contact",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.contact);
                      }),
                ],
              ),
            const Spacer(),
            Tooltip(
              margin: const EdgeInsets.only(top: 10),
              message: 'Client Login',
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                onTap: () {
                  Authentication().userState() == true
                      ? Navigator.pushNamed(context, Routes.client)
                      : Navigator.pushNamed(context, Routes.login);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Icon(
                    Authentication().userState() == true
                        ? CupertinoIcons.lock_open_fill
                        : CupertinoIcons.lock_fill,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const DateTimeWidget(),
          ],
        ),
      ),
      actions: [
        if (isMobileScreen)
          InkWell(
            onTap: () {
              setState(() {
                Scaffold.of(context).openEndDrawer();
              });
            },
            child: const Icon(
              CupertinoIcons.bars,
              size: 40,
              color: Colors.black87,
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
              right: isDesktopScreen
                  ? MediaQuery.of(context).size.width * .2
                  : isTabletScreen
                      ? MediaQuery.of(context).size.width * .1
                      : MediaQuery.of(context).size.width * .04),
        ),
        // Padding(
        //   padding: EdgeInsets.only(
        //       right: isDesktopScreen
        //           ? 200
        //           : isTabletScreen
        //           ? 100
        //           : 50),
        // ),
      ],
    );
  }
}
