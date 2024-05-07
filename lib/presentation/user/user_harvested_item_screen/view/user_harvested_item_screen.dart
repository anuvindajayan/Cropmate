import 'dart:developer';

import 'package:cropmate/global_widgets/crop_mate_icon_widget.dart';
import 'package:cropmate/global_widgets/item_card.dart';
import 'package:cropmate/presentation/user/user_harvested_item_screen/controller/user_harvested_item_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../common/item_detail_screen/view/product_detail_screen.dart';

class UserHarvestedItemScreen extends StatelessWidget {
  const UserHarvestedItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    Provider.of<UserHarvestedItemScreenController>(context, listen: false)
        .fetchProduct();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: ColorConstants.whiteColor,
          titleTextStyle: const TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          toolbarHeight: devWidth * .25,
          title: CropMateIconWidget(),
        ),
        body: Consumer<UserHarvestedItemScreenController>(
            builder: (context, controller, child) {
          return controller.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.all(devHeight * 0.01),
                  child: GridView.builder(
                    itemCount: controller.farmerProductModal.data?.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .58,
                        crossAxisCount: 2,
                        crossAxisSpacing: devHeight * .008,
                        mainAxisSpacing: devWidth * 0.02),
                    itemBuilder: (BuildContext context, int index) {
                      final datum = controller.farmerProductModal.data?[index];
                      log('data from user harvester screen = $datum');
                      if (datum != null) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemDetailsScreen(
                                    datum.data?.cropName ?? "",
                                    datum.data?.description ?? "",
                                    datum.data?.image ?? "",
                                    datum.data?.postedBy ?? "",
                                    datum.data?.price ?? 0),
                              ),
                            );
                            log("${datum.data?.cropName}\n${datum.data?.description}\n${datum.data?.image}\n${datum.data?.postedBy}\n${datum.data?.price}");
                          },
                          child: ItemCard(
                            title: datum.data?.cropName ?? '',
                            imageUrl: datum.data?.image ?? '',
                            price: datum.data?.price ?? 0.0,
                            quantity: datum.data?.quantity ?? 0,
                          ),
                        );
                      } else {
                        return SizedBox(); // Placeholder or loading indicator
                      }
                    },
                  ),
                );
        }),
      ),
    );
  }
}
