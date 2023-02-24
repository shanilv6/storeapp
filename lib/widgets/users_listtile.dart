import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/consts/color_constant.dart';
import 'package:storeapp/models/users_model.dart';

class UsersListTile extends StatelessWidget {
  const UsersListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersModel usersModelProvider= Provider.of<UsersModel>(context);
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        imageUrl: usersModelProvider.avatar.toString(),
        boxFit: BoxFit.fill,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
      ),
      title: Text(usersModelProvider.name.toString()),
      subtitle: Text(usersModelProvider.email.toString()),
      trailing: Text(
        usersModelProvider.role.toString(),
        style: TextStyle(
            color: ColorConstant.lightIconsColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
