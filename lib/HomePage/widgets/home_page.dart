import 'package:conagora/HomePage/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color background = const Color(0xFFFFFDF8);
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'Accueil',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Se connecter",
              style: TextStyle(color: Color(0xFFEFB32C)),
            ),
          ),
        ],
      ),
      body: ScrollableSection(),
      // padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 11),
      //     Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 11),
      //   child: ListView(
      //     children: const [
      //       HeaderSection(),
      //       ScrollableSection(),
      //     ],
      //   ),
      // ),

      // height: 150,
      // decoration: BoxDecoration(
      //     color: Colors.grey.shade200.withOpacity(0.5),
      //     image: const DecorationImage(
      //         fit: BoxFit.cover,
      //         image: NetworkImage(
      //             "https://images.unsplash.com/photo-1613636185975-7aeacfc34954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=406&q=80")),
      //     //color: Colors.green,
      //     borderRadius: BorderRadius.circular(20)),

      // child: GlassContainer(
      //   blur: 1,
      //   shadowStrength: 10,
      //   opacity: 0.2,
      //   child: Row(
      //     children: [
      //       Expanded(
      //           flex: 2,
      //           child: Container(
      //             //color: Colors.red,
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding:
      //                       const EdgeInsets.only(right: 230, bottom: 10),
      //                   child: Container(
      //                     height: 50,
      //                     width: 200,
      //                     decoration: const BoxDecoration(
      //                         color: Color(0xFF8CDE61),
      //                         borderRadius: BorderRadius.only(
      //                             bottomRight: Radius.circular(150),
      //                             bottomLeft: Radius.circular(5))),
      //                     child: const Center(
      //                       child: Text(
      //                         "Offre",
      //                         style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 20,
      //                             shadows: [
      //                               BoxShadow(
      //                                 color: Color(0xFFcd3c0c),
      //                                 blurRadius: 10,
      //                                 offset: Offset(3, 3),
      //                               )
      //                             ]),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 const Padding(
      //                   padding: EdgeInsets.all(2.0),
      //                   child: Text(
      //                     "30% Remise",
      //                     style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 30,
      //                         fontWeight: FontWeight.bold,
      //                         shadows: [
      //                           BoxShadow(
      //                             color: Colors.black,
      //                             blurRadius: 10,
      //                             offset: Offset(3, 3),
      //                           )
      //                         ]),
      //                   ),
      //                 ),
      //                 const Padding(
      //                   padding: EdgeInsets.only(left: 5),
      //                   child: Text(
      //                     "Pour pour votre deuxiemme visites",
      //                     style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 15,
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           )),
      //       Expanded(child: Container()),
      //     ],
      //   ),
      // ),
      // ),
      // ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //width: 200,
      decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/header.png")),
          // color: Colors.green,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                //color: Colors.red,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 130, bottom: 10),
                      //badge
                      // child: Container(
                      //   height: 50,
                      //   width: 100,
                      //   decoration: const BoxDecoration(
                      //       color: Color(0xFF950101),
                      //       borderRadius: BorderRadius.only(
                      //           bottomRight: Radius.circular(50),
                      //           bottomLeft: Radius.circular(50))),
                      //   child: const Center(
                      //     child: Text(
                      //       "offre",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 20,
                      //           shadows: [
                      //             BoxShadow(
                      //               color: Color(0xFFcd3c0c),
                      //               blurRadius: 10,
                      //               offset: Offset(3, 3),
                      //             )
                      //           ]),
                      //     ),
                      //   ),
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "30% Remise",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0xFFcd3c0c),
                                      blurRadius: 10,
                                      offset: Offset(3, 3),
                                    )
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Pour tout achat du fruits",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
