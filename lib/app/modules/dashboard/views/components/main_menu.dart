part of dashboard;

class MainMenu extends StatelessWidget {
  const MainMenu({super.key, required this.onPressedMainMenu});

  final Function(int index, SelectionButtonData value) onPressedMainMenu;
  @override
  Widget build(BuildContext context) {
    return SelectionButton(
      data: const [
        SelectionButtonData(
          activeIcon: EvaIcons.home,
          icon: EvaIcons.homeOutline,
          label: "Home",
        ),
        SelectionButtonData(
            activeIcon: EvaIcons.bell,
            icon: EvaIcons.bellOutline,
            label: "Notification",
            totalNotif: 100),
        SelectionButtonData(
            activeIcon: EvaIcons.doneAll,
            icon: EvaIcons.doneAllOutline,
            label: "Task",
            totalNotif: 17),
        SelectionButtonData(
          activeIcon: EvaIcons.settings2,
          icon: EvaIcons.settings2Outline,
          label: "Settings",
        ),
      ],
      onSelected: onPressedMainMenu,
    );
  }
}
