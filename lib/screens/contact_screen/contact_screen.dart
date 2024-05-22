import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/responsiveness/breakpoints.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/review_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final ScrollController scrollController = ScrollController();
  bool isSentMessage = false;

  @override
  Widget build(BuildContext context) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    var isMobileScreen = Breakpoints.isSmallScreen(context);

    return Scaffold(
      appBar: const CustomHeader(),
      endDrawer: isMobileScreen ? const CustomEndDrawer() : null,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  margin: isDesktopScreen
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .2,
                          vertical: 80)
                      : isTabletScreen
                          ? EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .1,
                              vertical: 80)
                          : EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .04,
                              vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Contact me",
                        style: isDesktopScreen
                            ? const TextStyle(fontSize: 33, color: Colors.black)
                            : isTabletScreen
                                ? const TextStyle(
                                    fontSize: 30, color: Colors.black)
                                : const TextStyle(
                                    fontSize: 24, color: Colors.black),
                      ),
                      SizedBox(
                        height: isMobileScreen ? 20 : 35,
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
                                horizontal:
                                    MediaQuery.of(context).size.width * .1,
                                vertical: 80)
                            : EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .04,
                                vertical: 60),
                    child: isMobileScreen
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              isSentMessage == true
                                  ? Container(
                                      width: double.infinity,
                                      height: 320,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.checkmark_alt,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Message Sent Successfully",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  cursorColor: Colors.black87,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        const Color(0xfff5f5f0),
                                                    filled: true,
                                                    hintText: 'Name',
                                                    hintStyle: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.black54,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
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
                                                    fillColor:
                                                        const Color(0xfff5f5f0),
                                                    filled: true,
                                                    hintText: 'Email',
                                                    hintStyle: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.black54,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            cursorColor: Colors.black87,
                                            minLines: 5,
                                            maxLines: 5,
                                            decoration: InputDecoration(
                                              fillColor:
                                                  const Color(0xfff5f5f0),
                                              filled: true,
                                              hintText:
                                                  'Tell me about your project',
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
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                isSentMessage = true;
                                                Future.delayed(
                                                    const Duration(seconds: 3),
                                                    () {
                                                  setState(() {
                                                    isSentMessage = false;
                                                  });
                                                });
                                              });
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 12),
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: const Text(
                                                "Send Message",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
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
                                          fontSize: 17, color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "You just need to make one more step to start your project",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    const Text(
                                      "Speak with me. Fill out the form to let me know what exactly you desire.",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
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
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Stack(
                                                  children: [
                                                    const CircleAvatar(
                                                      radius: 18,
                                                      backgroundImage:
                                                          AssetImage(
                                                        'assets/profiles/faisal.png',
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 10,
                                                      height: 10,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Colors.lightGreen,
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
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700),
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
                            ],
                          )
                        : IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: isSentMessage == true
                                      ? Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                CupertinoIcons.checkmark_alt,
                                                color: Colors.white,
                                                size: 50,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Message Sent Successfully",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            // mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      cursorColor:
                                                          Colors.black87,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: const Color(
                                                            0xfff5f5f0),
                                                        filled: true,
                                                        hintText: 'Name',
                                                        hintStyle:
                                                            const TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black54,
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Expanded(
                                                    child: TextFormField(
                                                      cursorColor:
                                                          Colors.black87,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: const Color(
                                                            0xfff5f5f0),
                                                        filled: true,
                                                        hintText: 'Email',
                                                        hintStyle:
                                                            const TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black54,
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              BorderSide.none,
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
                                                    fillColor:
                                                        const Color(0xfff5f5f0),
                                                    filled: true,
                                                    hintText:
                                                        'Tell me about your project',
                                                    hintStyle: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.black54,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isSentMessage = true;
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 3), () {
                                                      setState(() {
                                                        isSentMessage = false;
                                                      });
                                                    });
                                                  });
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20,
                                                      vertical: 12),
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: const Text(
                                                    "Send Message",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Don't hesitate",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black),
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
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Meet your Expert",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
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
                                                          backgroundImage:
                                                              AssetImage(
                                                            'assets/profiles/faisal.png',
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 10,
                                                          height: 10,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors
                                                                .lightGreen,
                                                            shape:
                                                                BoxShape.circle,
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
                                                          fontWeight:
                                                              FontWeight.w700),
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
                              horizontal:
                                  MediaQuery.of(context).size.width * .1,
                              vertical: 80)
                          : EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .04,
                              vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FAQs",
                        style: isDesktopScreen
                            ? const TextStyle(
                                fontSize: 33,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)
                            : isTabletScreen
                                ? const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)
                                : const TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "My commitment to transparency",
                        style: isDesktopScreen
                            ? const TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              )
                            : isTabletScreen
                                ? const TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                  )
                                : const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                      ),
                      const SizedBox(height: 20),
                      faqsTile(
                        question:
                            "What size budgets do you typically work with?",
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
                        question:
                            "What size budgets do you typically work with?",
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
          Positioned(
            right: MediaQuery.of(context).size.width < 800 ? 25 : 50,
            bottom: MediaQuery.of(context).size.width > 1100 ? 50 : 100,
            child: InkWell(
              onTap: () {
                scrollController.animateTo(0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  CupertinoIcons.up_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget faqsTile({
    required String question,
    required String answer,
    bool isFirst = false,
    bool isLast = false,
  }) {
    var isDesktopScreen = Breakpoints.isLargeScreen(context);
    var isTabletScreen = Breakpoints.isMediumScreen(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isFirst)
          const SizedBox(
            height: 15,
          ),
        Text(
          question,
          style: isDesktopScreen
              ? const TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )
              : isTabletScreen
                  ? const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )
                  : const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          answer,
          style: isDesktopScreen
              ? const TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                )
              : isTabletScreen
                  ? const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    )
                  : const TextStyle(
                      fontSize: 15,
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
