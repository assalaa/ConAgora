import 'package:conagora/data/category_list_data.dart';
import 'package:conagora/theme/constants.dart';
import 'package:flutter/material.dart';

class DishItemViewData{
  final String? dishName;
  final String? dishDescription;
  final double? dishPrice;

  const DishItemViewData({this.dishName, this.dishDescription, this.dishPrice});

  DishItemViewData.fromDish(Dish dish) : dishName = dish.dishName,
  dishDescription = dish.dishDescription,
  dishPrice = dish.dishPrice;
}

class DishItem extends StatelessWidget {
  const DishItem(this.dish, {Key? key}) : super(key: key);
  final DishItemViewData dish;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: productHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
            elevation: 6,
            shadowColor: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 100,
                    height: 100,
                    //fit: BoxFit.contain,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/plat1.png"),
                        ),
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    // child: Image.asset(
                    //   product.image,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dish.dishName!,
                        style: const TextStyle(
                            color: blueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        dish.dishDescription!,
                        maxLines: 2,
                        style: const TextStyle(
                            color: blueColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${dish.dishPrice.toString()} Dt",
                        style: const TextStyle(
                            color: greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
