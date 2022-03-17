import 'package:flutter/material.dart';

import '../HomePage/screens/category_list_section.dart';
import '../widgets/app_bar.dart';
//import '../widgets/category_list_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Custom_AppBar(),
      ),
      body: const CategoryListSection(),
    );
  }
}
