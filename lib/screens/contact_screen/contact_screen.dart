import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/review_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);

    return Scaffold(
      appBar: const CustomHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: isDesktopScreen
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .2,
                      vertical: 80)
                  : isTabletScreen
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .1,
                          vertical: 80)
                      : EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .04,
                          vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Contact me",
                    style: TextStyle(fontSize: 33, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Starting a new project? Get in touch and let's talk all about it",
                    style: isDesktopScreen
                        ? const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)
                        : isTabletScreen
                            ? const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)
                            : const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Call, email, meet or video call me - however you'd prefer to work I would love to hear from you",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xfff5f5f0),
              child: Container(
                margin: isDesktopScreen
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .2,
                        vertical: 100)
                    : isTabletScreen
                        ? EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .1,
                            vertical: 100)
                        : EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .04,
                            vertical: 100),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  // TextFormField(
                                  //   controller: _passwordController,
                                  //   obscureText: true,
                                  //   decoration: InputDecoration(
                                  //     labelText: 'Enter your password',
                                  //     labelStyle: TextStyle(
                                  //       fontSize: 16.0,
                                  //       color: Colors.black54,
                                  //     ),
                                  //     border: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(6)),
                                  //     focusedBorder: OutlineInputBorder(
                                  //       borderRadius: BorderRadius.circular(6),
                                  //       borderSide:
                                  //       BorderSide(color: Colors.black, width: 2.0),
                                  //     ),
                                  //   ),
                                  //   validator: (value) {
                                  //     if (value!.isEmpty) {
                                  //       return 'Password is missing';
                                  //     }
                                  //     return null;
                                  //   },
                                  // ),
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor: Colors.black87,
                                      decoration: InputDecoration(
                                        fillColor: const Color(0xfff5f5f0),
                                        filled: true,
                                        hintText: 'Name',
                                        hintStyle: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black54,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor: Colors.black87,
                                      decoration: InputDecoration(
                                        fillColor: const Color(0xfff5f5f0),
                                        filled: true,
                                        hintText: 'Email',
                                        hintStyle: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black54,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: TextFormField(
                                  cursorColor: Colors.black87,
                                  minLines: null,
                                  maxLines: null,
                                  expands: true,
                                  decoration: InputDecoration(
                                    fillColor: const Color(0xfff5f5f0),
                                    filled: true,
                                    hintText: 'Tell me about your project',
                                    hintStyle: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Text(
                                    "Send Message",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Don't hesitate",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "You just need to make one more step to start your project",
                                style: TextStyle(
                                    fontSize: 33,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text(
                                "Speak with me. Fill out the form to let me know what exactly you desire.",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Meet your Expert",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              const CircleAvatar(
                                                radius: 20,
                                                backgroundImage: AssetImage(
                                                  'assets/profiles/faisal.png',
                                                ),
                                              ),
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: const BoxDecoration(
                                                  color: Colors.lightGreen,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            "Faisal Nazir",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: isDesktopScreen
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .2,
                      vertical: 100)
                  : isTabletScreen
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .1,
                          vertical: 100)
                      : EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .04,
                          vertical: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "FAQs",
                    style: TextStyle(
                        fontSize: 33,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "My commitment to transparency",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  faqsTile(
                    question: "What size budgets do you typically work with?",
                    answer:
                        "We typically work with clients within the following budget brackets: 250\$ - Max. Deadline varies according to budget size.",
                    isFirst: true,
                  ),
                  faqsTile(
                    question:
                        "How do I figure out how much your services will cost?",
                    answer:
                        "Determining the cost of our services is best achieved through a 15-30 minute discovery call, where we can understand your unique requirements. Following that"
                        ", we will provide a transparent and detailed price within 24-48 hours tailored specifically to your needs.",
                  ),
                  faqsTile(
                    question: "What size budgets do you typically work with?",
                    answer:
                        "We typically work with clients within the following budget brackets: 250\$ - Max. Deadline varies according to budget size.",
                  ),
                  faqsTile(
                    question:
                        "How do I figure out how much your services will cost?",
                    answer:
                        "Determining the cost of our services is best achieved through a 15-30 minute discovery call, where we can understand your unique requirements. Following that"
                        ", we will provide a transparent and detailed price within 24-48 hours tailored specifically to your needs.",
                    isLast: true,
                  ),
                ],
              ),
            ),
            ReviewWidget(),
            const CustomFooter(hideButton: true),
          ],
        ),
      ),
    );
  }

  Widget faqsTile({
    required String question,
    required String answer,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isFirst)
          const SizedBox(
            height: 15,
          ),
        Text(
          question,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          answer,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
        if (isLast == false)
          const Divider(
            height: 70,
            thickness: 1,
          ),
      ],
    );
  }
}
