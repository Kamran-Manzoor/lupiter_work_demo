import 'package:flutter/material.dart';
import 'package:lupiter_work_demo/appearance/appearance_provider.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final Color color;
  final String title;
  final VoidCallback onPressed;
  final bool enabled;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
    this.margin = const EdgeInsets.all(16),
    this.color = Colors.teal,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appearance = AppearanceProvider.of(context);
    return Container(
      margin: margin,
      child: Opacity(
        opacity: (!enabled) ? 0.5 : 1.0,
        child: Material(
          borderRadius: BorderRadius.circular(25.0),
          color: appearance.primaryButtonColor,
          child: InkWell(
            onTap: enabled ? onPressed : null,
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: Text(
                title,
                style: appearance.primaryButtonTitleStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final String title;
  final VoidCallback onPressed;
  final bool enabled;

  const SecondaryButton(
      {Key? key,
      this.width = double.infinity,
      this.height = 50.0,
      this.margin = const EdgeInsets.all(16),
      required this.title,
      required this.onPressed,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: const Color(0xFFF0F0F0),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
