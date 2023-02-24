import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import 'feed_Container.dart';
class FeedsGridWidgets extends StatelessWidget {
  FeedsGridWidgets({Key? key, required this.productList}) : super(key: key);
 final List<ProductModel> productList;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.7),
        itemBuilder: (ctx, index) {
          return  ChangeNotifierProvider.value(
            value: productList[index],
            child: const FeedContainer(
            ),
          );
        });
  }
}
