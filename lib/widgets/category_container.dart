import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/consts/color_constant.dart';

import '../models/categories_model.dart';


class CategoryContainer extends StatelessWidget {
  const CategoryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryModel categoryModelProvider= Provider.of<CategoryModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.height * 0.2,
              width: double.infinity,
              imageUrl: categoryModelProvider.image.toString(),
              boxFit: BoxFit.fill,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Text(categoryModelProvider.name.toString(),textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              backgroundColor: ColorConstant.lightCardColor.withOpacity(0.5)
            ),),
          )

        ],
      ),
    );
  }
}
