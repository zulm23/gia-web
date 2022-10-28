import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_gia/app/shared_components/card_task.dart';
import 'package:web_gia/app/shared_components/list_task_assigned.dart';
import 'package:web_gia/app/shared_components/list_task_date.dart';
import 'package:web_gia/app/shared_components/task_progress.dart';

import '../../../constants/app_constants.dart';
import '../../../shared_components/user_profile.dart';
import '../views/dashboard_view.dart';

class DashboardController extends GetxController {
  final dataProfil = UserProfileData(
    image: const AssetImage(ImageRasterPath.man),
    name: "Zulmadi",
    jobDeks: "Project Manager",
  );

  void onPressedProfile() {
    debugPrint("data Profile");
  }

  void onSelectedMainMenu(int index, SelectionButtonData value) {
    debugPrint(value.label);
  }

  void onSelectedTaskMenu(int index, String label) {
    debugPrint(label);
  }

  final member = ["Siti Nuraini", "Bambang Liuer"];

  //search task
  void onSearchTask(String value) {}
  final TextEditingController searchControl = TextEditingController();

  //task
  final dataTAsk = const TaskProgressData(totalTask: 5, totalComplete: 2);

  //Task in progress CardTask
  final taskInProgress = [
    CardTaskData(
        label: "Determine meeting schedule",
        jobDesk: "System Analyst",
        dueDate: DateTime.now().add(const Duration(minutes: 50))),
    CardTaskData(
        label: "Personal Branding",
        jobDesk: "Marketing",
        dueDate: DateTime.now().add(const Duration(hours: 4))),
    CardTaskData(
        label: "UI UX",
        jobDesk: "Design",
        dueDate: DateTime.now().add(const Duration(days: 5))),
    CardTaskData(
        label: "Database Security",
        jobDesk: "System Security",
        dueDate: DateTime.now().add(const Duration(minutes: 50))),
  ];

  //wekly task
  final weeklyTask = [
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.monitor, color: Colors.indigo),
      label: "Slicing UI",
      jobDesk: "Programer",
      assingTo: "Alext Ferguso",
      editTo: DateTime.now().add(
        const Duration(hours: 2),
      ),
    ),
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.star, color: Colors.orange),
      label: "Personal branding",
      jobDesk: "Marketing",
      assingTo: "Justin Beck",
      editTo: DateTime.now().add(
        const Duration(days: 5),
      ),
    ),
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.colorPalette, color: Colors.blue),
      label: "UI UX",
      jobDesk: "Design",
    ),
    ListTaskAssignedData(
      icon: const Icon(
        EvaIcons.pieChart,
        color: Colors.redAccent,
      ),
      label: "Determine meeting schedule",
      jobDesk: "System Analyst",
    ),
  ];

  final taskGroup = [
    [
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 2, hours: 10)),
          label: "5 Posts on Instagram",
          jobDesk: "Marketing"),
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 2, hours: 11)),
          label: "Platform Concept",
          jobDesk: "Animation"),
    ],
    [
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 3, hours: 5)),
          label: "UI UX Marketplace",
          jobDesk: "Design"),
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 3, hours: 6)),
          label: "Create Post For App",
          jobDesk: "Marketing"),
    ],
    [
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 5, hours: 5)),
          label: "2 Post on Facebok",
          jobDesk: "Marketing"),
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 5, hours: 6)),
          label: "Create Icon App",
          jobDesk: "Design"),
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 2, hours: 10)),
          label: "Fixing Error Payment",
          jobDesk: "Programer"),
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 2, hours: 11)),
          label: "Create From Interview",
          jobDesk: "System Analyst"),
    ],
    [
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 12, hours: 10)),
          label: "5 Posts on Instagram",
          jobDesk: "Marketing"),
      ListTaskDateData(
          date: DateTime.now().add(const Duration(days: 12, hours: 11)),
          label: "Platform Concept",
          jobDesk: "Animation"),
    ],
  ];

  void onPressedTask(int index, ListTaskAssignedData data) {
    log("onPressedTask click", name: "onPressedTask");
  }

  void onPressedAssignTask(int index, ListTaskAssignedData data) {
    log("toAsign click", name: "toAsign");
  }

  void onPressedMember(int index, ListTaskAssignedData data) {
    log("onPressedMember click ${data.label}", name: "onPressedMember");
  }

  //Calender
  void onPressedCalender() {
    log("onPressed Calender", name: "Calender");
  }

  //TaskGeoup
  void onPressedTaskGoup(int index, ListTaskDateData data) {
    log("List task clicked ${data.label}", name: "taskgroup");
  }
}
