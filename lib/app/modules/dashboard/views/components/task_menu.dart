part of dashboard;

class TaskMenu extends StatelessWidget {
  const TaskMenu({super.key, required this.onSelected});

  final Function(int index, String label) onSelected;

  @override
  Widget build(BuildContext context) {
    return SimpleSelectionButton(data: const [
      "Directory",
      "Onboarding",
      "Offboarding",
      "Time-off",
    ], onSelected: onSelected);
  }
}
