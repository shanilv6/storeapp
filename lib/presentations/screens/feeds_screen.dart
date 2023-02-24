import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../services/api_handler.dart';
import '../../widgets/feed_Container.dart';

class FeedsScreen extends StatefulWidget {
  FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ProductModel> productList = [];
  int limit = 10;
//  bool _isloading = false;
  bool _islimit = false;

  @override
  void initState() {
    // TODO: implement initState
    getProducts();
    super.initState();
  }

  Future<void> getProducts() async {
    productList = await APIHandler.getAllProducts(limit: limit.toString());
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(() async {
      if (limit == 200) {
        _islimit = true;
        setState(() {

        });
        return;
      }
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        limit += 10;
        log("limit $limit");
        await getProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: productList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0.0,
                              mainAxisSpacing: 0.0,
                              childAspectRatio: 0.7),
                      itemBuilder: (ctx, index) {
                        return ChangeNotifierProvider.value(
                            value: productList[index],
                            child: const FeedContainer());
                      }),
                  if (!_islimit) Center(child: CircularProgressIndicator())
                ],
              ),
            ),
    );
  }
}
