import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/models/user_model.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/services/authentication.dart';
import 'package:my_portfolio/utilities/app_images.dart';
import 'package:my_portfolio/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool loading = false;
  bool isError = false;
  bool inActiveDialog = false;

  @override
  void initState() {
    initialLaunch = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f0),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.loginBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    width: isMobileScreen
                        ? MediaQuery.of(context).size.width * .8
                        : isTabletScreen
                            ? MediaQuery.of(context).size.width * .7
                            : MediaQuery.of(context).size.width * .5,
                    height: isMobileScreen
                        ? MediaQuery.of(context).size.height * .9
                        : isTabletScreen
                            ? MediaQuery.of(context).size.height * .7
                            : MediaQuery.of(context).size.height * .5,
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: isMobileScreen
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                CupertinoIcons.lock_fill,
                                size: 40,
                              ),
                              const SizedBox(height: 16.0),
                              const Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              const Text(
                                'Use your Client Account',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      cursorColor: Colors.black87,
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black54,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: 2.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email is missing';
                                        }
                                        String emailPattern =
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                        RegExp regex = RegExp(emailPattern);
                                        if (!regex.hasMatch(value)) {
                                          return 'Please enter valid Email';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black87,
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Enter your password',
                                        labelStyle: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black54,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: 2.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password is missing';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 25),
                                    const Text(
                                      "This is the restricted page and only clients who are engaged with Faisal Nazir can access it with their provided credentials.",
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 30),
                                    InkWell(
                                      onTap: loading
                                          ? () {}
                                          : () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  loading = true;
                                                  Authentication().loginUser(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                    onSuccess: () {
                                                      Authentication.userModel
                                                              .isActive
                                                          ? setState(() {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  Routes
                                                                      .client);
                                                              loading = false;
                                                              _emailController
                                                                  .clear();
                                                              _passwordController
                                                                  .clear();
                                                            })
                                                          : () {
                                                              inActiveDialog =
                                                                  true;
                                                              loading = false;
                                                              Authentication
                                                                      .userModel =
                                                                  UserModel();
                                                              Authentication()
                                                                  .logOutUser();
                                                            };
                                                    },
                                                    onError: () {
                                                      setState(() {
                                                        loading = false;
                                                        showError();
                                                      });
                                                    },
                                                  );
                                                });
                                              }
                                            },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 12),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: loading
                                            ? const SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 4,
                                                ),
                                              )
                                            : const Text(
                                                "Sign in",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.lock_fill,
                                      size: isTabletScreen ? 60 : 80,
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Text(
                                      'Sign in',
                                      style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Text(
                                      'Use your Client Account',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      overlayColor: WidgetStateProperty.all(
                                          Colors.transparent),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Routes.home);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black87,
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        child: const Icon(
                                          Ionicons.chevron_back,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Flexible(
                                  flex: isTabletScreen ? 7 : 6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      if (isError)
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Ionicons.alert_outline,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              "Invalid Credentials",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      if (isError) const Spacer(),
                                      TextFormField(
                                        cursorColor: Colors.black87,
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 2.0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Email is missing';
                                          }
                                          String emailPattern =
                                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                          RegExp regex = RegExp(emailPattern);
                                          if (!regex.hasMatch(value)) {
                                            return 'Please enter valid Email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      TextFormField(
                                        cursorColor: Colors.black87,
                                        controller: _passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Enter your password',
                                          labelStyle: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 2.0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Password is missing';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                          "This is the restricted page and only clients who are engaged with Faisal Nazir can access it with their provided credentials."),
                                      const SizedBox(height: 30),
                                      InkWell(
                                        onTap: loading
                                            ? () {}
                                            : () async {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  setState(() {
                                                    loading = true;
                                                    Authentication().loginUser(
                                                      email:
                                                          _emailController.text,
                                                      password:
                                                          _passwordController
                                                              .text,
                                                      onSuccess: () {
                                                        Authentication.userModel
                                                                    .isActive ==
                                                                true
                                                            ? setState(() {
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    Routes
                                                                        .client);
                                                                loading = false;
                                                                _emailController
                                                                    .clear();
                                                                _passwordController
                                                                    .clear();
                                                              })
                                                            : setState(() {
                                                                inActiveDialog =
                                                                    true;
                                                                loading = false;
                                                                Authentication
                                                                        .userModel =
                                                                    UserModel();
                                                                Authentication()
                                                                    .logOutUser();
                                                              });
                                                      },
                                                      onError: () {
                                                        setState(() {
                                                          loading = false;
                                                          showError();
                                                        });
                                                      },
                                                    );
                                                  });
                                                }
                                              },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 12),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: loading
                                              ? const SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 4,
                                                  ),
                                                )
                                              : const Text(
                                                  "Sign in",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  if (isMobileScreen)
                    Positioned(
                      top: 20,
                      left: 20,
                      child: InkWell(
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.home);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Ionicons.chevron_back,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  if (isMobileScreen && isError)
                    const Positioned(
                      top: 25,
                      right: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Ionicons.alert_outline,
                            color: Colors.red,
                          ),
                          Text(
                            "Invalid Credentials",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (inActiveDialog)
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .5,
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Ionicons.cloud_offline_outline,
                      size: 50,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "User inactive!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                        "Associated user is inactive! Contact administrator to revoke."),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, Routes.home);
                              inActiveDialog = false;
                            });
                          },
                          child: Container(
                              margin: const EdgeInsets.only(right: 60),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: const Text(
                                "Home",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              inActiveDialog = false;
                            });
                          },
                          child: Container(
                              margin: const EdgeInsets.only(right: 60),
                              width: 150,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Back to login",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, Routes.contact);
                              inActiveDialog = false;
                            });
                          },
                          child: Container(
                              width: 100,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Contact",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            left: 5,
            bottom: 2,
            child: Text(
              AppConstants.appVersion,
              style: const TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showError() {
    setState(() {
      isError = true;
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isError = false;
        });
      });
    });
  }
}
