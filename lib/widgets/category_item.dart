import 'package:conagora/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/category_list_data.dart';

const _blueColor = Color(0xFF0D1863);

// ignore: unused_element
class _CategoryItem extends StatelessWidget {
  //const _RappiCategoryItem({Key? key}) : super(key: key);
  const _CategoryItem(this.category);
  final MenuModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.white,
        height: categoryHeight,
        alignment: Alignment.centerLeft,
        child: Text(
          category.categoryName!,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _blueColor,
            ),
          ),
        ));
  }
}
