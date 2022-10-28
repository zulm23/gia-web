part of dashboard;

class HeaderWeeklyTask extends StatelessWidget {
  const HeaderWeeklyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const HeaderText(data: "Weekly task"),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey,
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text("Archive"),
          ),
          const SizedBox(width: 5),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(EvaIcons.plus),
            label: const Text("New"),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ],
      ),
    );
  }
}

class WeeklyTaskButton extends StatelessWidget {
  const WeeklyTaskButton({
    Key? key,
    required this.label,
    this.ikon,
    required this.color,
  }) : super(key: key);

  final String label;
  final IconData? ikon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(ikon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
