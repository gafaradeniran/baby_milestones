import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double? height;
  final double? width;
  final Color? textColor;
  final double? fontSize;
  final double borderRadius;
  final FontWeight? fontWeight;
  const AppButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.height,
      this.width,
      this.textColor,
      this.fontWeight,
      required this.borderRadius,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      height: height,
      minWidth: width,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, color: textColor, fontWeight: fontWeight),
      ),
    );
  }
}
