import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:storeapp/consts/color_constant.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/api_handler.dart';
import '../../widgets/appbar_icons.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final String id;
   ProductsDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}
class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  ProductModel ? productModel;
  bool isError = false;
  Future<void>getProductInfo()async{
   try{
     productModel =await APIHandler.getProductById(id: widget.id);
   }catch(error){
     isError = true;
    log("error $error");
   }
    setState(() {
    });
  }
@override
  void initState() {
   getProductInfo();
    super.initState();
  }

  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(

          child: isError ?Center(child: Text("An error occured"))

         : productModel == null ? Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            AppBarWithBack(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel!.category!.name.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 3,
                          child: Text(
                            productModel!.title.toString(),
                            textAlign: TextAlign.start,
                            style: titleStyle,
                          )),
                      Flexible(
                        flex: 2,
                        child: RichText(
                            text: TextSpan(
                                text: '\$',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromRGBO(33, 150, 243, 1)),
                                children: <TextSpan>[
                              TextSpan(
                                  text:  productModel!.price.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.lightTextColor))
                            ])),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: size.height * 0.4,
                    child: Swiper(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return FancyShimmerImage(
                          imageUrl: productModel!.images![index].toString(),
                          boxFit: BoxFit.fill,
                        );
                      },
                      autoplay: true,
                      pagination: const SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.white, activeColor: Colors.red)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: titleStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            productModel!.description.toString(),textAlign: TextAlign.start,style: TextStyle(
                          fontSize: 20,

                        )
                          ,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
