
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const _blueColor = Color(0xFF0D1863);
const _greenColor = Color(0xFFEFB32C);
const double appPadding = 25.0;
const double spacer = 50.0;
const double smallSpacer = 30.0;
const double miniSpacer = 10.0;

class CustomPromotionCard extends StatelessWidget {
  const CustomPromotionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: appPadding, right: appPadding),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            //width: size.width,
            //height: size.width * .425,
            width: 450,
            height: 170,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: _blueColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Try our new recipe which \nwas made for you only",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 7.0),
                Container(
                  width: size.width * .425,
                  child: const Text(
                    "Try it now",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 25.0,
                  width: 80.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _greenColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: _greenColor.withOpacity(0.5),
                        spreadRadius: 0.0,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: const Text(
                    'Détaille',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 2.0,
            left: -20.0,
            child: Container(
              height: size.width * .3,
              child: SvgPicture.asset(
                "undraw_online_groceries_a02y.svg",
              ),
              //undraw_online_groceries_a02y
            ),
          )
        ],
      ),
    );
  }
}
