import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/models/users_model.dart';
import 'package:storeapp/widgets/users_listtile.dart';

import '../../services/api_handler.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: FutureBuilder<List<UsersModel>>(
            future: APIHandler.getAllUsers(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                Center(child: Text("An error has occurred ${snapshot.error}"));
              } else if (snapshot.data == null) {
                const Center(child: Text("No users has been added yet"));
              }
              return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![index],
                        child: const UsersListTile());
                  });
            })));
  }
}
