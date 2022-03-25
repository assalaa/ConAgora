import 'package:conagora/Pages/detailsPage/widgets/quantity_section.dart';
import 'package:conagora/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/category_list_data.dart';

class DetailsSection extends StatelessWidget {
  //final repo = MenuRepository();
  var name;
  var description;
  var price;
  DetailsSection(this.name, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1000,
        height: 1000,
        padding: const EdgeInsets.all(25),
        color: Colors.white,
        child: Column(
          children: [
            Text(name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            const SizedBox(
              height: 10,
            ),
            Text(description,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 12)),
            const SizedBox(
              height: 30,
            ),
            QuantitySection(price),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text(
                  "Ingredients",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/plat1.png",
                                  width: 42,
                                ),
                                const Flexible(child: Text("Rice"))
                              ],
                            ),
                          ),
                      separatorBuilder: (_, index) => const SizedBox(
                            width: 15,
                          ),
                      itemCount: 4),
                ),
              ],
            ),
            Column(children: const [
              // Text(
              //   "About",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // ),
              // Text(
              //   "AboutAboutAboutAboutAboutAboutAbout",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // ),
            ])
          ],
        ));
  }
}
