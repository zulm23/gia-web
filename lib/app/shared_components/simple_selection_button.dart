// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:web_gia/app/constants/app_constants.dart';

class SimpleSelectionButton extends StatefulWidget {
  const SimpleSelectionButton(
      {super.key,
      this.intialSelected = 0,
      required this.data,
      required this.onSelected});

  final int intialSelected;
  final List<String> data;
  final Function(int index, String value) onSelected;

  @override
  State<SimpleSelectionButton> createState() => _SimpleSelectionButtonState();
}

class _SimpleSelectionButtonState extends State<SimpleSelectionButton> {
  late int selected;
  @override
  void initState() {
    selected = widget.intialSelected;
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
      {super.key,
      required this.selected,
      required this.data,
      required this.onPressed});

  final bool selected;
  final String data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 5,
          height: (selected) ? 30 : 0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Theme.of(context).primaryColor),
        ),
        Expanded(
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: (!selected)
                        ? kFontColorPallets[1]
                        : Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: kSpasing / 2),
                  Expanded(
                    child: Text(
                      data,
                      style: TextStyle(
                          color: (!selected)
                              ? kFontColorPallets[1]
                              : Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
