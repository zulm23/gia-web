part of dashboard;

class TaskGroup extends StatelessWidget {
  const TaskGroup(
      {super.key,
      required this.title,
      required this.data,
      required this.onPressed});

  final String title;
  final List<ListTaskDateData> data;
  final Function(int index, ListTaskDateData data) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpasing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ...data
              .asMap()
              .entries
              .map((e) => ListTaskDate(
                    data: e.value,
                    onPressed: () => onPressed(e.key, e.value),
                    dividerColor: getSequenceColor(e.key),
                  ))
              .toList(),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      title,
      style: TextStyle(
        color: kFontColorPallets[2],
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Color getSequenceColor(int index) {
    int value = index % 3;
    switch (value) {
      case 2:
        return Colors.amber;
      case 1:
        return Colors.redAccent;

      default:
        return Colors.lightBlue;
    }
  }
}
