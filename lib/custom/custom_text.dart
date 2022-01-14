import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomText extends StatelessWidget {
  final String ?text;
  final double ?size;
  final Color ?color;
  final int? maxlines;
  final TextOverflow? overflow;
  final TextDirection? textDir;
  final TextAlign? textAlign;
  final FontWeight ?weight;
  final TextDecoration? textDecoration;
  const CustomText({ @required this.text, this.size, this.color,this.weight,this.textAlign,this.overflow,this.maxlines,this.textDir,this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,style: GoogleFonts.poppins(fontSize: size?? 16,color: color ??  Colors.black,fontWeight: weight ?? FontWeight.normal,decoration: textDecoration),
      maxLines: maxlines,
      overflow: overflow,
      textDirection: textDir,
      textAlign: textAlign,
    );
  }
}
