import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:web_gia/app/constants/app_constants.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key, this.onSearch, this.hintText});

  final Function(String value)? onSearch;
  final String? hintText;
  final control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: control,
      decoration: InputDecoration(
        hintText: hintText ?? "search",
        prefixIcon: const Icon(EvaIcons.search),
        enabledBorder:
            const UnderlineInputBorder(borderSide: BorderSide(width: 1)),
      ),
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        if (onSearch != null) onSearch!(control.text);
      },
      textInputAction: TextInputAction.search,
      style: TextStyle(color: kFontColorPallets[1]),
    );
  }
}
