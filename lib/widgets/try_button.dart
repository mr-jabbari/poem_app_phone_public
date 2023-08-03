import 'package:flutter/material.dart';

class TryButton extends StatelessWidget {
  final String lable;
  final double width;
  final Function() onPressed;

  const TryButton(
      {Key? key,
      required this.width,
      required this.lable,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
          color: Colors.tealAccent, borderRadius: BorderRadius.circular(25)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          lable,
        ),
      ),
    );
  }
}
