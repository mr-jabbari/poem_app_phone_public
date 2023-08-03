import 'package:flutter/material.dart';


class MyCoustomeIcons extends StatelessWidget {
  final String iconName;
  final int color;
  final double size;
  const MyCoustomeIcons({Key? key,required this.iconName, required this.color, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage('assets/icons/$iconName.png')
      ,size: size,
      color: Color(color),

    );
  }
}