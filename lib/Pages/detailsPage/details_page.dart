import 'package:conagora/Pages/detailsPage/widgets/details_section.dart';
import 'package:conagora/Pages/detailsPage/widgets/quantity_section.dart';
import 'package:conagora/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/image_banner.dart';

class DetailsPage extends StatelessWidget {
  var name;
  var description;
  var price;
  DetailsPage(
      @required this.name, @required this.description, @required this.price,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              leftIcon: Icons.arrow_back_ios_new,
              rightIcon: Icons.favorite_border,
              //leftCallBack: ()=> Navigator.of(context).pop,
            ),
            ImageSection(),
            DetailsSection(name, description),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: blueColor,
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
