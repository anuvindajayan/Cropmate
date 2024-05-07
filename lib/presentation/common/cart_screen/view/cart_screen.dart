import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/global_widgets/matterial_button_widget.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../user/user_harvested_item_screen/controller/user_harvested_item_controller.dart';
//
// class cartScreen extends StatefulWidget {
//   @override
//   State<cartScreen> createState() => _cartScreenState();
// }
//
// class _cartScreenState extends State<cartScreen> {
//   int index = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     final cartItems = context.watch<UserHarvestedItemScreenController>().cart;
//     num total = 0;
//     for (var item in cartItems) {
//       total = total + (item.price! * item.count);
//     }
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               CupertinoIcons.back,
//               color: Colors.black,
//             )),
//         title: Text(
//           "Cart",
//           style: TextStyle(color: ColorConstants.blackColor, fontSize: 30),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.separated(
//               itemCount: cartItems.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 5, right: 5),
//                         height: 100,
//                         width: 100,
//                         // decoration: BoxDecoration(
//                         //     image: DecorationImage(
//                         //         image: AssetImage(cartItems[index].image), fit: BoxFit.contain)),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Text(
//                                   cartItems[index].name,
//                                   maxLines: 1,
//                                 )),
//                             Text("${cartItems[index].price}₹/ Kg")
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 78, right: 5),
//                         child: Wrap(
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   // context
//                                   //     .read<UserHarvestedItemScreenController>()
//                                   //     .addToList(cartItems[index]);
//                                 },
//                                 icon: Icon(CupertinoIcons.add)),
//                             Column(
//                               children: [
//                                 Text(
//                                   "${cartItems[index].count} Kg",
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                                 Icon(
//                                   CupertinoIcons.cart,
//                                   size: 40,
//                                 ),
//                               ],
//                             ),
//                             IconButton(
//                                 onPressed: () {
//                                   // context
//                                   //     .read<UserHarvestedItemScreenController>()
//                                   //     .removeFromList(cartItems[index]);
//                                 },
//                                 icon: Icon(CupertinoIcons.minus))
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return SizedBox();
//               },
//             ),
//           ),
//           MaterialButtonWidget(
//             onPressed: () {},
//             buttonText: "${total > 0 ? "Pay Now $total" : ("Pay Now")}",
//             buttonColor: ColorConstants.primaryColor,
//           )
//         ],
//       ),
//     );
//   }
// }
// //total > 0 ? Text("Pay Now $total") : Text("Pay Now")
