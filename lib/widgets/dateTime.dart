import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget {
  final bool timeOnly;

  const DateTimeWidget({super.key, this.timeOnly = false});

  @override
  DateTimeWidgetState createState() => DateTimeWidgetState();
}

class DateTimeWidgetState extends State<DateTimeWidget> {
  late String _currentDate;
  late String _currentDay;
  late String _currentTime;
  late String _currentTimeOnly;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    // Update time every second
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateDateTime();
    });
  }

  void _updateDateTime() {
    DateTime now = DateTime.now();
    _currentDate = DateFormat('MMM dd, yyyy').format(now);
    _currentDay = DateFormat('EEEE').format(now);
    _currentTime = DateFormat('HH:mm:ss a').format(now);
    _currentTimeOnly = DateFormat('HH:mm:ss').format(now);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.timeOnly
        ? Text(
            _currentTimeOnly,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          )
        : Container(
            margin: const EdgeInsets.only(right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "$_currentDay, ",
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _currentDate,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  _currentTime,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
  }
}
