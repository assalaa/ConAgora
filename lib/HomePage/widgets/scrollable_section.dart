import 'package:conagora/HomePage/widgets/scrollable_bloc.dart';
import 'package:flutter/material.dart';

const categoryHeight = 55.0;
const productHeight = 100.0;

class ScrollableSection extends StatefulWidget {
  const ScrollableSection({Key? key}) : super(key: key);

  @override
  _ScrollableSectionState createState() => _ScrollableSectionState();
}

class _ScrollableSectionState extends State<ScrollableSection>
    with SingleTickerProviderStateMixin {
  final _bloc = ScrollableBloc();

  @override
  void initState() {
    _bloc.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   color: Colors.white,
            //   height: 90,
            //   child: Row(
            //     children: const [Text("data")],
            //   ),
            // ),
            Container(
              //color: Colors.green,
              height: 60,
              child: TabBar(
                controller: _bloc.tabController,
                //indicatorWeight: 0.1,
                isScrollable: true,
                tabs: _bloc.tabs.map((e) => TabWidget()).toList(),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.blue,
              child: ListView.builder(
                itemCount: 20,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  if (index.isOdd) {
                    return CategoryWidget();
                  } else {
                    return ProductItemWidget();
                  }
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  //const TabWidget({Key? key}) : super(key: key);
  const TabWidget(this.tabCategory);
  final CategoryWidget tabCategory;

  @override
  Widget build(BuildContext context) {
    //this container could be changed to a card
    return const Card(
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          tabCategory.category.name,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: categoryHeight,
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: const Text(
        'Categorie',
        style: TextStyle(
            color: Color(0xFF0D1863),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: productHeight,
      child: const Text('Produit'),
    );
  }
}
