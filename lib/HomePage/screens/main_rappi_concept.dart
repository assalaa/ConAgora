import 'package:conagora/HomePage/screens/rappi_bloc.dart';
import 'package:conagora/HomePage/screens/rappi_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _backgroundColor = Color(0xFFF6F9FA);
const _blueColor = Color(0xFF0D1863);
const _greenColor = Color(0xFFEFB32C);
const categoryHeight = 55.0;
const productHeight = 110.0;

class MainRappiConcept extends StatelessWidget {
  const MainRappiConcept({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData.light(), child: _RappiConcept());
  }
}

class _RappiConcept extends StatefulWidget {
  const _RappiConcept({Key? key}) : super(key: key);

  @override
  State<_RappiConcept> createState() => _RappiConceptState();
}

class _RappiConceptState extends State<_RappiConcept>
    with SingleTickerProviderStateMixin {
  final _bloc = RappiBLoC();

  @override
  void initState() {
    _bloc.init(this);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _bloc,
          builder: (_, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                height: 80,
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Accueil",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _blueColor,
                          ),
                        ),
                      ),
                      //Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {},
                        child: const Text('Se connecter',
                            style: TextStyle(color: _greenColor)),
                      )
                    ],
                  ),
                ),
              ),

              /**
               ************************************************************
               * ****************************************************** /**
               * /             --------------------------
               * *********** //TAB BAR FOR CATEGORIES//**************** 
                            ---------------------------
               * *******************************************************/** 
               ************************************************************
               */*/

              CategoryTab(bloc: _bloc),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    controller: _bloc.scrollController,
                    itemCount: _bloc.items.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      final item = _bloc.items[index];
                      if (item.isCategory) {
                        return _RappiCategoryItem(item.category!);
                      } else {
                        return _RappiProductItem(item.product!);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
    required RappiBLoC bloc,
  })  : _bloc = bloc,
        super(key: key);

  final RappiBLoC _bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      //for test
      //color: Colors.green,
      height: 60,
      child: TabBar(
        onTap: _bloc.onCategorySelected,
        controller: _bloc.tabController,
        isScrollable: true,
        indicatorWeight: 0.4,
        tabs: _bloc.tabs.map((e) => _RappiTabWidget(e)).toList(),
      ),
    );
  }
}

class _RappiTabWidget extends StatelessWidget {
  // const _RappiTabWidget({Key? key}) : super(key: key);
  const _RappiTabWidget(this.tabCategory);
  final RappiTabCategory tabCategory;

  @override
  Widget build(BuildContext context) {
    final selected = tabCategory.selected;
    return Opacity(
      opacity: selected ? 1 : 0.5,
      child: Card(
        elevation: selected ? 6 : 0,
        color: selected ? _blueColor : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tabCategory.category.name,
            style: TextStyle(
                color: selected ? Colors.white : _blueColor,
                fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
        ),
      ),
    );
  }
}

class _RappiCategoryItem extends StatelessWidget {
  //const _RappiCategoryItem({Key? key}) : super(key: key);
  const _RappiCategoryItem(this.category);
  final RappiCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.white,
        height: categoryHeight,
        alignment: Alignment.centerLeft,
        child: Text(
          category.name,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _blueColor,
            ),
          ),
        ));
  }
}

class _RappiProductItem extends StatelessWidget {
  //const _RappiProductItem({Key? key}) : super(key: key);
  const _RappiProductItem(this.product);
  final RappiProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(product.image),
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
                        product.name,
                        style: const TextStyle(
                            color: _blueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        product.description,
                        maxLines: 2,
                        style: const TextStyle(
                            color: _blueColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${product.price.toString()} Dt",
                        style: const TextStyle(
                            color: _greenColor,
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
