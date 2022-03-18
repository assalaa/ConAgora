import 'package:conagora/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.categoryName, {Key? key}) : super(key: key);
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
        height: categoryHeight,
        alignment: Alignment.centerLeft,
        child: Text(
          categoryName,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: blueColor,
            ),
          ),
        ));
  }
}
