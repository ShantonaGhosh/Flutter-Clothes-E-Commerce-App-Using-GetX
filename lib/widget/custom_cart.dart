import 'package:clothes_ecommerce_app/widget/my_text_style.dart';

import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({
    super.key,
    this.onTap,
  
    this.image,
    this.productTitle,
    this.price,
    this.buttonTitle,
    this.tkText,
    this.leftIcon,
    this.rightIcon, this.buttonClr, this.iconClr, 
  });

  final VoidCallback? onTap;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Color? buttonClr;
  final Color? iconClr;
  final String? productTitle;
  final int? price;
  final String? buttonTitle;
  final String? tkText;

  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 400,
      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //border: Border.all(color: Colors.green, width: 0.5),
          color: Colors.green[50],
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 3,
                offset: Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: leftIcon
                ),
                GestureDetector(
                  onTap: onTap,
                  child: rightIcon
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: image ??
                    Image.asset(
                      'assets/images/shirt1.png',
                      height: 100,
                      fit: BoxFit.cover,
                    ),
              ),
            ),
            Text(
              '$productTitle',
              style: myTextStyle(clr: Colors.green),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  '$tkText',
                  style: myTextStyle(clr: Colors.green),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  '$price',
                  style: myTextStyle(clr: Colors.green),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green[200]),
              child: CustomButton(
                onTap: onTap,
                title: Text('$buttonTitle'),
                clr: buttonClr ?? Colors.green[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
