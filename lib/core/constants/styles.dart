import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

//////////////////////

//Poppins Text Style

Text quickSandTitleText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? textOverflow,
}) {
  return Text(
    text,
    maxLines: maxLines ?? 3,
    overflow: textOverflow,
    textAlign: textAlign ?? TextAlign.start,
    style: GoogleFonts.quicksand(
      color: color, //?? blackColor,
      fontSize: fontSize ?? 24.sp,
      fontWeight: fontWeight ?? FontWeight.bold,
    ),
  );
}

Text quickSandMediumText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? textOverflow,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    maxLines: maxLines ?? 3,
    overflow: textOverflow,
    style: GoogleFonts.quicksand(
      color: color ?? blackColor,
      fontSize: fontSize ?? 15.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
    ),
  );
}

Text quickSandNormalText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? textOverflow,
}) {
  return Text(
    text,
    maxLines: maxLines ?? 3,
    overflow: textOverflow,
    textAlign: textAlign ?? TextAlign.start,
    style: GoogleFonts.quicksand(
      color: color ?? blackColor,
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
  );
}

TextStyle quickSandStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
}) {
  return GoogleFonts.quicksand(
    color: color ?? blackColor,
    fontSize: fontSize ?? 20.sp,
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}
