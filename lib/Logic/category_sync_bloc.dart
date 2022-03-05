import 'package:conagora/data/category_list_data.dart';
import 'package:conagora/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySyncBLoC with ChangeNotifier {
  List<TabCategory> tabs = [];
  List<ListItem> items = [];
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
    tabController = TabController(length: myCategories.length, vsync: ticker);
    double offsetForm = 0.0;
    double offsetTo = 0.0;
    for (int i = 0; i < myCategories.length; i++) {
      final category = myCategories[i];
      if (i > 0) {
        offsetForm += myCategories[i - 1].products.length * productHeight;
      }
      if (i < myCategories.length - 1) {
        offsetTo =
            offsetForm + myCategories[i + 1].products.length * productHeight;
      } else {
        offsetTo = double.infinity;
      }
      tabs.add(
        TabCategory(
          category: category,
          selected: (i == 0),
          offsetFrom: categoryHeight * i + offsetForm,
          offsetTo: offsetTo,
        ),
      );

      //final products = <RappiProduct>[];
      items.add(ListItem(category: category));
      for (int j = 0; j < category.products.length; j++) {
        final product = category.products[j];
        items.add(ListItem(product: product));
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

class TabCategory {
  const TabCategory({
    required this.category,
    required this.selected,
    required this.offsetFrom,
    required this.offsetTo,
  });

  TabCategory copyWith(bool selected) => TabCategory(
      category: category,
      selected: selected,
      offsetFrom: offsetFrom,
      offsetTo: offsetTo);

  final CategoryData category;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;
}

class ListItem {
  final CategoryData? category;
  final ProductData? product;

  const ListItem({this.category, this.product});
  bool get isCategory => category != null;
}
