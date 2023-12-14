import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon, suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  const CustomTextField(
      {super.key,
      required this.controller,
      this.label,
      this.inputFormatters,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.maxLines,
      this.hint,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50,
      child: TextFormField(
        controller: controller,
        autofocus: false,
        keyboardType: keyboardType,
        inputFormatters: const [],
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefix: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.purple)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.purple)),
          // fillColor: Colors.white,
        ),
        maxLines: maxLines,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
