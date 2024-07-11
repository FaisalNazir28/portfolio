import 'package:flutter/material.dart';
import 'package:my_portfolio/main.dart';
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
    return Authentication().userState() == true
        ? Scaffold(
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Client Screen"),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("uid==> ${Authentication.userModel.uid}"),
                  Text("name==> ${Authentication.userModel.name}"),
                  Text("email==> ${Authentication.userModel.email}"),
                  Text("phone==> ${Authentication.userModel.phone}"),
                  Text("company==> ${Authentication.userModel.company}"),
                  Text("is active==> ${Authentication.userModel.isActive}"),
                  Text("is admin==> ${Authentication.userModel.isAdmin}"),
                  Text(
                    "designation==> ${Authentication.userModel.designation}",
                  ),
                  const SizedBox(
                    height: 30,
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
