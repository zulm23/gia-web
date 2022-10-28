import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_gia/app/constants/app_constants.dart';
import '../utils/helpers/app_helpers.dart';

class CardTaskData {
  final String label;
  final String jobDesk;
  final DateTime dueDate;

  CardTaskData(
      {required this.label, required this.jobDesk, required this.dueDate});
}

class CardTask extends StatelessWidget {
  const CardTask(
      {super.key,
      required this.data,
      required this.primary,
      required this.onPrimary});

  final CardTaskData data;
  final Color primary;
  final Color onPrimary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpasing / 2),
      child: Stack(children: [
        Material(
          child: InkWell(
            onTap: () {
              log("Task card clicked", name: "task");
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 30),
              padding: const EdgeInsets.all(kSpasing),
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [primary, primary.withOpacity(.7)],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Text(
                      data.label,
                      style: TextStyle(
                        color: onPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: kSpasing),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: onPrimary.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      data.jobDesk,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: onPrimary,
                          letterSpacing: 1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: kSpasing * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        EvaIcons.calendar,
                        size: 18,
                        color: onPrimary,
                      ),
                      Text(
                        DateFormat('d MMM').format(data.dueDate),
                        style: TextStyle(
                            fontSize: 12, color: onPrimary.withOpacity(.8)),
                      ),
                      Container(
                        width: 2,
                        height: 10,
                        color: onPrimary,
                      ),
                      Icon(
                        EvaIcons.clock,
                        size: 18,
                        color: onPrimary,
                      ),
                      Text(
                        data.dueDate.dueDate(),
                        style: TextStyle(
                            fontSize: 12, color: onPrimary.withOpacity(.8)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      log("Elevated button", name: "button");
                    },
                    icon: const Icon(EvaIcons.checkmarkCircle2Outline),
                    label: const Text("Done"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: onPrimary,
                        foregroundColor: primary,
                        enabledMouseCursor: MouseCursor.defer),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Transform.translate(
              offset: const Offset(150, -25),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white.withOpacity(.1),
              ),
            )),
        Align(
            alignment: Alignment.bottomLeft,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white.withOpacity(.1),
            )),
      ]),
    );
  }
}
