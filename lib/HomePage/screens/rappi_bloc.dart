import 'package:conagora/HomePage/screens/main_rappi_concept.dart';
import 'package:conagora/HomePage/screens/rappi_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RappiBLoC with ChangeNotifier {
  List<RappiTabCategory> tabs = [];
  List<RappiItem> items = [];
  //late TabController _tabController;
  late TabController tabController;

  //get onCategorySelected => null;
  void onCategorySelected(int index) {
    final selected = tabs[index];
    print(index);
    for (int i = 0; i < tabs.length; i++) {
      final condition = selected.category.name == tabs[i].category.name;
      print(condition);
      //final tabCategory = tabs[i];
      //if (selected == tabCategory) {
      tabs[i] = tabs[i].copyWith(condition);
      //}
    }
    notifyListeners();
  }

  void init(TickerProvider ticker) {
    tabController =
        TabController(length: rappiCategories.length, vsync: ticker);
    for (int i = 0; i < rappiCategories.length; i++) {
      final category = rappiCategories[i];
      tabs.add(
        RappiTabCategory(
          category: category,
          selected: (i == 0),
        ),
      );

      //final products = <RappiProduct>[];
      items.add(RappiItem(category: category, product:null));
      for (int j = 0; j < category.products.length; j++) {
        final product = category.products[j];
        items.add(RappiItem(product: category, category: null));
      }
    }
  }
}
//}

class RappiTabCategory {
  const RappiTabCategory({required this.category, required this.selected});

  RappiTabCategory copyWith(bool selected) =>
      RappiTabCategory(category: category, selected: selected);

  final RappiCategory category;
  final bool selected;
}

class RappiItem {
  final RappiCategory category;
  final RappiProduct product;

  const RappiItem({
    required this.category, required this.product
    });
  bool get isCategory => category != null;
}
