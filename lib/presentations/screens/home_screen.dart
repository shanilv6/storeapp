import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:storeapp/presentations/screens/category_screen.dart';
import 'package:storeapp/presentations/screens/feeds_screen.dart';
import 'package:storeapp/presentations/screens/users_screen.dart';
import 'package:storeapp/services/api_handler.dart';
import 'package:storeapp/widgets/feeds_grid.dart';
import '../../models/product_model.dart';
import '../../widgets/appbar_icons.dart';
import '../../widgets/sales_container.dart';
import '../../widgets/search_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;

  // List<ProductModel> productList = [];

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
/*

  @override
  void didChangeDependencies() {

    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await APIHandler.getAllProducts();
    setState(() {
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: const CategoryScreen()));
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
                function: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const UsersScreen()));
                },
                icon: IconlyBold.user3)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SearchWidget(textEditingController: _textEditingController),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        // width: double.infinity,
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return const SalesWidget();
                          },
                          autoplay: true,
                          pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.white,
                                  activeColor: Colors.red)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Latest Products',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AppBarIcons(
                                function: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FeedsScreen()));
                                },
                                icon: IconlyBold.arrowRight2)
                          ],
                        ),
                      ),
                      FutureBuilder<List<ProductModel>>(
                          future: APIHandler.getAllProducts(limit: '3'),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              Center(
                                  child: Text(
                                      "An error has occurred ${snapshot.error}"));
                            } else if (snapshot.data == null) {
                              const Center(
                                  child:
                                      Text("No products has been added yet"));
                            }
                            return FeedsGridWidgets(
                                productList: snapshot.data!);
                          }))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
