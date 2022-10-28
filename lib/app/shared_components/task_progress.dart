import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TaskProgressData {
  const TaskProgressData({
    required this.totalTask,
    required this.totalComplete,
  });

  final int totalTask;
  final int totalComplete;
}

class TaskProgress extends StatelessWidget {
  const TaskProgress({super.key, required this.data});

  final TaskProgressData data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(
        //   "Task: ",
        //   style: TextStyle(
        //       color: kFontColorPallets[2],
        //       fontWeight: FontWeight.w600,
        //       fontSize: 16),
        // ),

        LinearPercentIndicator(
          barRadius: const Radius.circular(20),
          // leading: const Icon(Icons.check_circle),
          width: 255,
          lineHeight: 25,
          percent: data.totalComplete / data.totalTask,
          center: Row(
            children: [
              const Icon(EvaIcons.doneAllOutline, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                "Task : ${data.totalComplete} of ${data.totalTask} completed",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          progressColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
          // linearStrokeCap: LinearStrokeCap.roundAll,
          animation: true,
          animationDuration: 5000,
        )
      ],
    );
  }
}
