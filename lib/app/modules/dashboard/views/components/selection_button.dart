part of dashboard;

class SelectionButtonData {
  const SelectionButtonData({
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.totalNotif,
  });
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotif;
}

class SelectionButton extends StatefulWidget {
  const SelectionButton(
      {super.key,
      this.initialSelected = 0,
      required this.data,
      required this.onSelected});

  final int initialSelected;
  final List<SelectionButtonData> data;
  final Function(int index, SelectionButtonData value) onSelected;

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  late int selected;
  @override
  void initState() {
    selected = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data.asMap().entries.map((e) {
        final index = e.key;
        final data = e.value;
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: _Button(
            selected: selected == index,
            data: data,
            onPressed: () {
              widget.onSelected(index, data);
              setState(() {
                selected = index;
              });
            },
          ),
        );
      }).toList(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {required this.selected, required this.data, required this.onPressed});

  final bool selected;
  final SelectionButtonData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          (!selected) ? null : Theme.of(context).primaryColor.withOpacity(.2),
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      child: InkWell(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                (!selected) ? data.icon : data.activeIcon,
                size: 20,
                color: (!selected)
                    ? kFontColorPallets[1]
                    : Theme.of(context).primaryColor,
              ),
              const SizedBox(width: kSpasing / 2),
              Text(
                data.label,
                style: TextStyle(
                    color: (!selected)
                        ? kFontColorPallets[1]
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .8,
                    fontSize: 14),
              ),
              const Spacer(),
              (data.totalNotif == null || data.totalNotif! <= 0)
                  ? Container()
                  : Container(
                      width: 28,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                      child: Text(
                        (data.totalNotif! >= 100)
                            ? "99+"
                            : "${data.totalNotif}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
