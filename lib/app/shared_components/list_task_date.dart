import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_gia/app/constants/app_constants.dart';

class ListTaskDateData {
  final DateTime date;
  final String label;
  final String jobDesk;

  ListTaskDateData(
      {required this.date, required this.label, required this.jobDesk});
}

class ListTaskDate extends StatelessWidget {
  const ListTaskDate({
    super.key,
    required this.data,
    required this.onPressed,
    this.dividerColor,
  });

  final ListTaskDateData data;
  final Function() onPressed;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(kSpasing / 2),
        child: Row(
          children: [
            buildHours(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpasing / 2),
              child: buildDivinder(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitle(),
                  buildSubTitle(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHours() {
    return Text(
      DateFormat.Hm().format(data.date),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget buildDivinder() {
    return Container(
      height: 30,
      width: 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        gradient: LinearGradient(
          colors: [
            dividerColor ?? Colors.amber,
            dividerColor?.withOpacity(.6) ?? Colors.amber.withOpacity(.6),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      data.jobDesk,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
    );
  }

  Widget buildSubTitle() {
    return Text(
      data.label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.w800),
    );
  }
}
