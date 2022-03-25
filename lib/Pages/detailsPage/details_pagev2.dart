import 'package:conagora/theme/constants.dart';
import 'package:conagora/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPgaeV2 extends StatefulWidget {
  const DetailsPgaeV2({Key? key}) : super(key: key);

  @override
  State<DetailsPgaeV2> createState() => _DetailsPgaeV2State();
}

class _DetailsPgaeV2State extends State<DetailsPgaeV2> {
  get backgroundColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                leftIcon: Icons.arrow_back_ios_new,
                rightIcon: Icons.favorite_border,
                //leftCallBack: ()=> Navigator.of(context).pop,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/chad-montano-MqT0asuoIcU-unsplash.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Dish Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  Text("Rating")
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ingrediants",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: blueColor),
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
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: blueColor.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                // changes position of shadow
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
