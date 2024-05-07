import 'dart:developer';

import 'package:cropmate/presentation/farmer/home_screen/controller/Home_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../global_widgets/crop_mate_icon_widget.dart';
import '../../../../global_widgets/item_card.dart';
import '../../../common/cart_screen/view/cart_screen.dart';
import '../../../common/item_detail_screen/view/product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<FarmerHomeScreenController>(context, listen: false);
    provider.fetchEqpList();
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: CropMateIconWidget(),
            centerTitle: true,
            toolbarHeight: devHeight * .1,
            //
          ),
          body: Consumer<FarmerHomeScreenController>(
              builder: (context, controller, child) =>
                  controller.isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: EdgeInsets.all(devHeight * 0.01),
                          child: GridView.builder(
                            itemCount: controller.equipmentListModel.data?.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: .70,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: devHeight * .008,
                                    mainAxisSpacing: devWidth * 0.02),
                            itemBuilder: (BuildContext context, int index) {
                              final datum =
                                  controller.equipmentListModel.data?[index];
                              print('data from home screen = $datum');
                              if (datum != null) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailsScreen(datum.eqipmentName??"", datum.description??"", datum.image??"", "", datum.price??0)));
                                    },
                                  child: ItemCard(
                                    title: datum.eqipmentName ?? '',
                                    imageUrl: datum.image ?? '',
                                    price: datum.price ?? 0.0,
                                    quantity: datum.qty ?? 0,
                                  ),
                                );
                              } else {
                                return SizedBox(); // Placeholder or loading indicator
                              }
                            },
                          ),
                        ))),
    );
  }
}
