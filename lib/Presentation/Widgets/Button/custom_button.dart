
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Config/text_style.dart';
class CustomButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? height;
  final bool? boder;
  final Color? textColor;
  final VoidCallback? onTap;
  CustomButton({ this.title, this.color, this.textColor, this.onTap,Key? key, this.boder=false, this.height=48}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:double.infinity,
        height:height!.h,
        decoration:boder!? BoxDecoration(
          border: Border.all(color: color!),
          borderRadius: BorderRadius.circular(10),
        ):BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title!,
            style: boldText(16.sp,color:boder!? color!: textColor!),
              textScaleFactor: 1.0),
        ),
      ),
    );
  }
}
