import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:web_gia/app/constants/app_constants.dart';
import '../utils/helpers/app_helpers.dart';

class ListTaskAssignedData {
  final Icon icon;
  final String label;
  final String jobDesk;
  final DateTime? editTo;
  final String? assingTo;

  ListTaskAssignedData(
      {required this.icon,
      required this.label,
      required this.jobDesk,
      this.editTo,
      this.assingTo});
}

class ListTaskAssigned extends StatelessWidget {
  const ListTaskAssigned(
      {super.key,
      required this.data,
      required this.onPressed,
      this.onPressedAssign,
      this.onPressedMember});

  final ListTaskAssignedData data;
  final Function() onPressed;
  final Function()? onPressedAssign;
  final Function()? onPressedMember;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPressed,
        hoverColor: Colors.indigo.withOpacity(.1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.withOpacity(.2),
          ),
          child: data.icon,
        ),
        title: Text(
          data.label,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: _buildSubtitle(),
        trailing: _buildAssign());
  }

  // ignore: unused_element
  Widget _buildSubtitle() {
    String edit = "";
    if (data.editTo != null) {
      edit = "\u2022 edited ${timeago.format(data.editTo!)}";
    }
    return Text(data.jobDesk + edit);
  }

  // ignore: unused_element
  Widget _buildAssign() {
    return (data.assingTo != null)
        ? InkWell(
            onTap: onPressedAssign,
            child: Tooltip(
              message: data.assingTo,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.orange.withOpacity(.2),
                child: Text(
                  data.assingTo!.getInitialName().toUpperCase(),
                  style: const TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        : DottedBorder(
            color: kFontColorPallets[1],
            strokeCap: StrokeCap.round,
            borderType: BorderType.Circle,
            child: IconButton(
              onPressed: onPressedAssign,
              icon: const Icon(EvaIcons.plus),
              color: kFontColorPallets[1],
              iconSize: 15,
              splashRadius: 24,
              tooltip: "Assign",
            ),
          );
  }
}
