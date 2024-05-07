import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/global_widgets/matterial_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app_config/app_config.dart';
import '../../buy_now_screen/view/buy_now_screen.dart';

class ItemDetailsScreen extends StatefulWidget {
  final String? title;
  final String? description;
  final String? imageUrl;

  final String? sourceName;
  final double? price;
  int quantity = 1;

  ItemDetailsScreen(
      this.title, this.description, this.imageUrl, this.sourceName, this.price);

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    double totalPrice = widget.price! * widget.quantity;
    final media = AppConfig.mediaurl + widget.imageUrl!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(CupertinoIcons.cart_badge_plus),
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(devHeight * 0.01),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 40 / 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage(media??"assets/images/hammer.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(devWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title??"",
                      style: TextStyle(
                          fontSize: devHeight * 0.04,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.description??"",
                      style: TextStyle(
                        fontSize: devHeight * 0.03,
                      ),
                    ),
                    Text(
                      widget.sourceName??"",
                      style: TextStyle(
                        fontSize: devHeight * 0.02,
                      ),
                    ),
                    Text(
                      "Availability",
                      style: TextStyle(
                        fontSize: devHeight * 0.02,
                      ),
                    ),
                    // TextButton(onPressed: (){}, child: Text("Reviews"))
                    Text(
                      "Price/Quantity",
                      style: TextStyle(
                          fontSize: devHeight * 0.03,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (widget.quantity > 1) {
                                widget.quantity--;
                              }
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(
                          "${widget.quantity??""}",
                          style: TextStyle(
                            fontSize: devHeight * 0.03,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.quantity++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                    Text(
                      "Total Price: ${totalPrice.toStringAsFixed(2)}",
                      // Display total price
                      style: TextStyle(
                        fontSize: devHeight * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: devHeight * 0.03,
                    ),
                    MaterialButtonWidget(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyNowScreen(
                              imageUrl: media,
                              title: widget.title!,
                              price: totalPrice,
                              quantity: widget.quantity,
                            ),
                          ),
                        );
                      },
                      buttonColor: ColorConstants.primaryColor,
                      buttonText: "Buy now",
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
