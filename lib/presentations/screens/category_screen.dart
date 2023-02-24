import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/models/categories_model.dart';
import 'package:storeapp/services/api_handler.dart';
import 'package:storeapp/widgets/category_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: FutureBuilder<List<CategoryModel>>(
            future: APIHandler.getAllCategories(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                Center(child: Text("An error has occurred ${snapshot.error}"));
              } else if (snapshot.data == null) {
                const Center(child: Text("No products has been added yet"));
              }
              return GridView.builder(
                  shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 1.2),
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![index],
                        child: const CategoryContainer());
                  });
            })));
  }
}
