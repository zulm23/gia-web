library dashboard;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:web_gia/app/shared_components/card_task.dart';
import 'package:web_gia/app/shared_components/header_text.dart';
import 'package:web_gia/app/shared_components/list_task_assigned.dart';
import 'package:web_gia/app/shared_components/list_task_date.dart';
import 'package:web_gia/app/shared_components/search_field.dart';
import 'package:web_gia/app/shared_components/task_progress.dart';
import '../../../utils/helpers/app_helpers.dart';

import '../../../constants/app_constants.dart';
import '../../../shared_components/simple_selection_button.dart';
import '../../../shared_components/simple_user_profil.dart';
import '../../../shared_components/user_profile.dart';
import '../controllers/dashboard_controller.dart';

//Components
part '../views/components/main_menu.dart';
part '../views/components/member.dart';
part '../views/components/selection_button.dart';
part '../views/components/task_menu.dart';
part '../views/components/task_in_progress.dart';
part '../views/components/weekly_task.dart';
part '../views/components/header_weekly_task.dart';
part '../views/components/task_group.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            flex: 3,
            child: SingleChildScrollView(child: _buildSidebar(context))),
        Flexible(flex: 10, child: _buildTaskContent()),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const VerticalDivider(),
        ),
        Flexible(
            flex: 4,
            child: SingleChildScrollView(child: _buildCalenderContent())),
      ],
    ));
  }

  // ignore: unused_element
  Widget _buildCalenderContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpasing),
      child: Column(
        children: [
          const SizedBox(height: kSpasing),
          Row(
            children: [
              const Expanded(
                child: HeaderText(data: "Calender"),
              ),
              IconButton(
                onPressed: controller.onPressedCalender,
                icon: const Icon(EvaIcons.calendarOutline),
                tooltip: "Calender",
              ),
            ],
          ),
          ...controller.taskGroup
              .map((e) => TaskGroup(
                  title: DateFormat('d MMMM').format(e[0].date),
                  data: e,
                  onPressed: controller.onPressedTaskGoup))
              .toList()
        ],
      ),
    );
  }

  Widget _buildTaskContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpasing),
      child: Column(
        children: [
          const SizedBox(height: kSpasing),
          SearchField(
            hintText: "Search Task",
            onSearch: controller.onSearchTask,
          ),
          const SizedBox(height: kSpasing),
          Row(
            children: [
              HeaderText(data: DateTime.now().formatdMMMMY()),
              const Spacer(),
              TaskProgress(data: controller.dataTAsk)
            ],
          ),
          TaskInProgress(
            data: controller.taskInProgress,
          ),
          const HeaderWeeklyTask(),
          WeeklyTask(
            data: controller.weeklyTask,
            onPressedMember: controller.onPressedTask,
            onPressed: controller.onPressedAssignTask,
            pressedAssign: controller.onPressedMember,
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UserProfile(
          data: controller.dataProfil,
          onPressed: controller.onPressedProfile,
        ),
        MainMenu(
          onPressedMainMenu: controller.onSelectedMainMenu,
        ),
        const Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Member(member: controller.member, maxDisplayPeople: 2),
        ),
        const SizedBox(height: kSpasing),
        TaskMenu(onSelected: controller.onSelectedTaskMenu),
        const SizedBox(height: 80),
        // const Spacer(),
        Text(
          "2022 Teamwork lisence",
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: kSpasing / 2),
      ],
    );
  }
}
