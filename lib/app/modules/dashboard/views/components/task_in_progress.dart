part of dashboard;

class TaskInProgress extends StatelessWidget {
  const TaskInProgress({super.key, required this.data});

  final List<CardTaskData> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) => CardTask(
            data: data[index],
            primary: _getSequenceColor(index),
            onPrimary: Colors.white),
      ),
    );
  }

  Color _getSequenceColor(int index) {
    int value = index % 4;
    switch (value) {
      case 3:
        return Colors.indigo;
      case 2:
        return Colors.amber;
      case 1:
        return Colors.redAccent;

      default:
        return Colors.lightBlue;
    }
  }
}
