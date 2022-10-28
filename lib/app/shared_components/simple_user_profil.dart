import 'package:flutter/material.dart';
import 'package:web_gia/app/constants/app_constants.dart';

import '../utils/helpers/app_helpers.dart';

class SimpleUserProfil extends StatelessWidget {
  const SimpleUserProfil(
      {super.key, required this.name, required this.onPressed});

  final String name;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.orange.withOpacity(.2),
        child: Text(
          name.getInitialName(),
          style: const TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.more_horiz),
        splashRadius: 24,
      ),
      title: Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: kFontColorPallets[0]),
      ),
    );
  }
}
