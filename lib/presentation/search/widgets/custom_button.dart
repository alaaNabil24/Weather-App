import 'package:flutter/material.dart';


// todo :  Default Button in app
// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  dynamic color;
  String? text;
  // ignore: prefer_typing_uninitialized_variables
  var textColor;
  VoidCallback? onTap;
  // ignore: non_constant_identifier_names
  double? border_radius;
  // ignore: prefer_typing_uninitialized_variables
  var textSize;

  Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(border_radius ?? 25.0),
          boxShadow: [
            BoxShadow(
              color: color ?? Colors.blue,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            )
          ]),

      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border_radius ?? 25.0)),
          ),
          child: childWidget ??
              Text(
                text ?? "",
                style: TextStyle(
                  fontFamily: "f",
                  color: textColor ?? Colors.black,
                  fontSize: textSize ?? 18,
                ),
              )),
    );
  }

  // ignore: use_key_in_widget_constructors
  DefaultButton(this.text,
      {this.onTap,
        this.color,
        this.border_radius,
        this.textSize,
        this.textColor,
        this.childWidget});
}