import 'package:flutter/material.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/screens/login_screen/login_screen.dart';
import 'package:my_portfolio/services/authentication.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  void initState() {
    initialLaunch = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);
    return Authentication().userState() == true
        ? Scaffold(
            body: Container(
              margin: isDesktopScreen
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .1,
                      vertical: 120)
                  : EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .04,
                      vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          Authentication.userModel.profilePicture,
                          width: 180,
                          height: 180,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 60,
                                color: Colors.black87),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            Authentication.userModel.name,
                            style: const TextStyle(
                                fontSize: 45,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const Text("Client Screen"),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // Text("uid==> ${Authentication.userModel.uid}"),
                  // Text("name==> ${Authentication.userModel.name}"),
                  // Text("email==> ${Authentication.userModel.email}"),
                  // Text("phone==> ${Authentication.userModel.phone}"),
                  // Text("company==> ${Authentication.userModel.company}"),
                  // Text("is active==> ${Authentication.userModel.isActive}"),
                  // Text("is admin==> ${Authentication.userModel.isAdmin}"),
                  // Text(
                  //     "profile url==> ${Authentication.userModel.profilePicture}"),
                  // Text(
                  //   "designation==> ${Authentication.userModel.designation}",
                  // ),
                  // const SizedBox(
                  //   height: 80,
                  // ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(100),
                  //   child: Image.network(
                  //     Authentication.userModel.profilePicture,
                  //     width: 80,
                  //     height: 80,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 100,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.home);
                      Authentication().logOutUser();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const LoginScreen();
  }
}
