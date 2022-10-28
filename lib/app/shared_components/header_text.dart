import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
    );
  }
}
