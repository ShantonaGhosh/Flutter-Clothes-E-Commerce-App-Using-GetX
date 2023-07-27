import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.hinText,
    this.prefixIcon,
    this.sufixIcon,
    this.obSecureText,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hinText;

  final Icon? prefixIcon;
  final Widget? sufixIcon;
  final bool? obSecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecureText ?? false,
      controller: controller,
      validator: (value) => value == '' ? 'please enter some value' : null,
      style: const TextStyle(color: Colors.black87),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
          hintText: hinText,
          hintStyle: const TextStyle(color: Colors.black45),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(color: Colors.white60),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(color: Colors.white60),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(color: Colors.white60),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(color: Colors.white60),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          fillColor: Colors.white70,
          filled: true),
    );
  }
}
