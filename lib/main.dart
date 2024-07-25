import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/screens/about_screen/about_screen.dart';
import 'package:my_portfolio/screens/case_studies_screen/case_studies_screen.dart';
import 'package:my_portfolio/screens/contact_screen/contact_screen.dart';
import 'package:my_portfolio/screens/home_screen/home_screen.dart';
import 'package:my_portfolio/screens/page_not_found_screen/page_not_found_screen.dart';
import 'package:my_portfolio/screens/playground_screen/playground_screen.dart';
import 'package:my_portfolio/screens/project_view_screen/project_view_screen.dart';
import 'package:my_portfolio/screens/services_screen/services_screen.dart';
import 'package:my_portfolio/services/firebase_options.dart';

import 'screens/client_screen/client_screen.dart';
import 'screens/login_screen/login_screen.dart';

bool initialLaunch = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faisal Nazir',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const HomeScreen(),
        Routes.about: (context) => const AboutScreen(),
        Routes.login: (context) => const LoginScreen(),
        Routes.client: (context) => const ClientScreen(),
        Routes.playground: (context) => const PlayGroundScreen(),
        Routes.services: (context) => const ServicesScreen(),
        Routes.caseStudies: (context) => const CaseStudiesScreen(),
        Routes.pageNotFound: (context) => const PageNotFound(),
        Routes.contact: (context) => const ContactPage(),
        Routes.project: (context) => const ProjectScreen(),
      },
      onUnknownRoute: (unknownRoute) {
        return MaterialPageRoute(builder: (_) => const PageNotFound());
      },
    );
  }
}
