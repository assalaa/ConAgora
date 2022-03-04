import 'package:conagora/HomePage/screens/main_rappi_concept.dart';
import 'package:conagora/HomePage/screens/rappi_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RappiBLoC with ChangeNotifier {
  List<RappiTabCategory> tabs = [];
  List<RappiItem> items = [];
  //late TabController _tabController;
  late TabController tabController;
  ScrollController scrollController = ScrollController();

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

    scrollController.animateTo(selected.offsetFrom,
        duration: const Duration(microseconds: 500), curve: Curves.bounceOut);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScrollListener);
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  void init(TickerProvider ticker) {
    tabController =
        TabController(length: rappiCategories.length, vsync: ticker);
    double offsetForm = 0.0;
    double offsetTo = 0.0;
    for (int i = 0; i < rappiCategories.length; i++) {
      final category = rappiCategories[i];
      if (i > 0) {
        offsetForm += rappiCategories[i - 1].products.length * productHeight;
      }
      if (i < rappiCategories.length - 1) {
        offsetTo =
            offsetForm + rappiCategories[i + 1].products.length * productHeight;
      } else {
        offsetTo = double.infinity;
      }
      tabs.add(
        RappiTabCategory(
          category: category,
          selected: (i == 0),
          offsetFrom: categoryHeight * i + offsetForm,
          offsetTo: offsetTo,
        ),
      );

      //final products = <RappiProduct>[];
      items.add(RappiItem(category: category));
      for (int j = 0; j < category.products.length; j++) {
        final product = category.products[j];
        items.add(RappiItem(product: product));
      }
    }
    scrollController.addListener(_onScrollListener);
  }

  void _onScrollListener() {
    for (int i = 0; i < tabs.length; i++) {
      final tab = tabs[i];
      if (scrollController.offset >= tab.offsetFrom &&
          scrollController.offset <= tab.offsetTo &&
          !tab.selected) {
        onCategorySelected(i);
        break;
      }
    }
  }
}
//}

class RappiTabCategory {
  const RappiTabCategory({
    required this.category,
    required this.selected,
    required this.offsetFrom,
    required this.offsetTo,
  });

  RappiTabCategory copyWith(bool selected) => RappiTabCategory(
      category: category,
      selected: selected,
      offsetFrom: offsetFrom,
      offsetTo: offsetTo);

  final RappiCategory category;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;
}

class RappiItem {
  final RappiCategory? category;
  final RappiProduct? product;

  const RappiItem({this.category, this.product});
  bool get isCategory => category != null;
}
