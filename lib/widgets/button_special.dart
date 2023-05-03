import 'package:flutter/material.dart';

class Specialbutton extends StatelessWidget{
  
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final VoidCallback? ontap;
  final double height;
  final double width;
  final Widget child;

  const Specialbutton({
    Key? key,
    required this.child,
    this.ontap,
    this.color,
    this.borderRadius,
    this.height = 50,
    this.width = 50,
    this.margin,
    this.padding,
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color?? Colors.white,
      borderRadius: borderRadius?? BorderRadius.circular(8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: ontap,
        child: Container(
          alignment: Alignment.center,
          margin: margin,
          padding: padding,
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}