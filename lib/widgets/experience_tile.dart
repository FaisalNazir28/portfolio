import 'package:flutter/material.dart';

class ExperienceTile extends StatefulWidget {
  final String companyLogo;
  final String title;
  final String startDate;
  final String? endDate;

  const ExperienceTile({
    super.key,
    required this.companyLogo,
    required this.title,
    required this.startDate,
    this.endDate,
  });

  @override
  State<ExperienceTile> createState() => _ExperienceTileState();
}

class _ExperienceTileState extends State<ExperienceTile> {
  @override
  Widget build(BuildContext context) {
    String timePeriod = (widget.endDate == null || widget.endDate!.isEmpty)
        ? widget.startDate
        : "${widget.startDate} - ${widget.endDate}";
    return IntrinsicWidth(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(widget.companyLogo),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(timePeriod),
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.2,
            height: 40,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
