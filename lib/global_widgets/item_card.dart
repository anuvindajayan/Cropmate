import 'package:cropmate/app_config/app_config.dart';
import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/presentation/user/user_harvested_item_screen/controller/user_harvested_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../repository/api/common/cart_page/model/cart_page_modal.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    this.title,
    this.description,
    this.imageUrl,
    this.contant,
    this.sourceName,
    this.price,
    this.quantity,
    this.item,
  });

  final String? title;
  final String? description;
  final String? imageUrl;
  final String? contant;
  final String? sourceName;
  final double? price;
  final int? quantity;
  final Items? item;

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;

    final media = AppConfig.mediaurl + imageUrl!;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.lightGreenColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: devHeight * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(media), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title!,
                  style: TextStyle(
                      fontSize: devHeight * 0.02, fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("₹ $price"),
                  Text(
                    "Available: $quantity",
                  ),
                ],
              ),
              // SingleChildScrollView(
              //   child: Text(
              //     "$sourceName",
              //   ),
              //   scrollDirection: Axis.horizontal,
              // ),
              // MaterialButton(
              //   color: ColorConstants.primaryColor,
              //   onPressed: () {
              //     // context
              //     //     .read<UserHarvestedItemScreenController>()
              //     //     .addToList(item!);
              //   },
              //   child: Text(
              //     "ADD TO CART",
              //     style: TextStyle(color: ColorConstants.whiteColor),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
