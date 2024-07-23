import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {super.key,
        required this.controller,
        required this.hintText,
        this.textInputType,
        this.errorMsg,
        this.isRequired,
        this.enabled = true,
        this.pattern,
        this.suffixIcon,
        this.change,
        autoFillHints,
        this.maxLines = 1,
        this.inputLength,
        this.isPassword = false,
        this.textCenter = false,
        this.icon});

  final TextEditingController controller;

  Widget? suffixIcon;
  bool? textCenter;
  var autoFillHints;
  Widget? icon;
  bool? enabled;
  int? inputLength;
  bool isPassword;
  final String hintText;
  String? errorMsg;
  void Function(String)? change;
  int maxLines;
  TextInputType? textInputType;
  bool? isRequired;

  final String? pattern;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(5),

        ),
        child: TextFormField(

          autofillHints:  autoFillHints,
          textAlign: textCenter == true ? TextAlign.center : TextAlign.start,
          onChanged: change,
          controller: controller,
          obscureText: isPassword,
          maxLength: inputLength,
          enabled: enabled,
          maxLines: maxLines,
          keyboardType: textInputType,
          validator: (value) {
            RegExp regExp = RegExp(pattern ?? "");
            if (isRequired == true && value!.isEmpty) {
              return "هذه الخانة مطلوبة";
              print("هذه الخانة مطلوبة");
            } else if (!regExp.hasMatch(value ?? "") && pattern != null) {
              return errorMsg;
            }
          },
          decoration: InputDecoration(
              counterText: "",


              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color:  Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red),
              ),
              hintText: hintText,
              helperStyle: const TextStyle(fontFamily: "ff"),
              suffixIcon: suffixIcon,
              prefixIcon: icon),

        ),
      ),
    );
  }
}