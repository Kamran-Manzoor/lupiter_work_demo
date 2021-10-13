import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lupiter_work_demo/appearance/appearance_provider.dart';

class SimpleTextField extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final double height;
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final bool enable;
  final int maxLines;
  final FocusNode focusNode;
  final bool obscureText;
  final bool borders;
  final int maxLength;
  final EdgeInsets contentPadding;

  const SimpleTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.keyboardType = TextInputType.text,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    this.height = 54,
    this.labelText = 'Input',
    this.hintText = '',
    this.textCapitalization = TextCapitalization.none,
    this.enable = true,
    this.maxLines = 1,
    this.obscureText = false,
    this.borders = true,
    this.maxLength = 250,
    this.contentPadding = const EdgeInsets.only(
      left: 16.0,
      top: 14.0,
      bottom: 14.0,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appearance = AppearanceProvider.of(context);
    return Container(
      height: height,
      margin: margin,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: borders ? appearance.textFieldDecoration : null,
      child: TextField(
        obscureText: obscureText,
        enabled: enable,
        controller: controller,
        maxLength: maxLength,
        textCapitalization: textCapitalization,
        keyboardType: keyboardType,
        maxLines: maxLines,
        focusNode: focusNode,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          counterText: '',
          contentPadding: contentPadding,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: hintText,
        ),
      ),
    );
  }
}
