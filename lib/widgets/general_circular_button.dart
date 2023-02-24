import 'package:flutter/material.dart';

class GeneralCircularButton extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback onPressed;
  final Icon icon;
  const GeneralCircularButton({
    Key? key,
    required this.backgroundColor,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: backgroundColor,
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
