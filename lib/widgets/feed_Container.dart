import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/consts/color_constant.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/presentations/screens/products_details_screen.dart';

class FeedContainer extends StatelessWidget {
  const FeedContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModelProvider= Provider.of<ProductModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: ProductsDetailsScreen(id: productModelProvider.id.toString(),),
                    type: PageTransitionType.fade));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                          text: TextSpan(
                              text: '\$',
                              style: const TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1),
                              ),
                              children: <TextSpan>[
                            TextSpan(
                                text: "${productModelProvider.price}",
                                style: TextStyle(
                                    color: ColorConstant.lightTextColor,
                                    fontWeight: FontWeight.w600))
                          ])),
                    ),
                    const Icon(IconlyBold.heart)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  height: size.height * 0.2,
                  width: double.infinity,
                  imageUrl: productModelProvider.images![0],
                  boxFit: BoxFit.fill,
                  errorWidget: const Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                    size: 28,
                  ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                   productModelProvider.title.toString(),
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2,
                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
