part of dashboard;

class WeeklyTask extends StatelessWidget {
  const WeeklyTask(
      {super.key,
      required this.data,
      required this.onPressedMember,
      required this.onPressed,
      required this.pressedAssign});

  final List<ListTaskAssignedData> data;
  final Function(int index, ListTaskAssignedData data) onPressedMember;
  final Function(int index, ListTaskAssignedData data) onPressed;
  final Function(int index, ListTaskAssignedData data) pressedAssign;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data
          .asMap()
          .entries
          .map((e) => ListTaskAssigned(
                data: e.value,
                onPressed: () => onPressed(e.key, e.value),
                onPressedAssign: () => pressedAssign(e.key, e.value),
                onPressedMember: () => onPressedMember(e.key, e.value),
              ))
          .toList(),
    );
  }
}
