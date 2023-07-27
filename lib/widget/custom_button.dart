import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.title,
    this.onTap, this.clr,
  }) : super(key: key);

  final Widget? title;
  final VoidCallback? onTap;
  final Color? clr;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
          height: 30,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),  color: clr?? Colors.black),
          child: title),
    );
  }
}
