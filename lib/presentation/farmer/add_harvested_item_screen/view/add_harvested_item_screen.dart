// import 'package:cropmate/core/constants/color_constants.dart';
// import 'package:cropmate/global_widgets/matterial_button_widget.dart';
// import 'package:cropmate/global_widgets/textfield.dart';
// import 'package:flutter/material.dart';
//
//
//
// class AddHarvestedItemScreen extends StatefulWidget {
//   const AddHarvestedItemScreen({super.key});
//
//   @override
//   State<AddHarvestedItemScreen> createState() => _AddHarvestedItemScreenState();
// }
//
// class _AddHarvestedItemScreenState extends State<AddHarvestedItemScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     var devHeight = MediaQuery.of(context).size.height;
//     var devWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add harvested item"),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         minimum: EdgeInsets.only(top: devHeight * 0.04),
//         child: ListView(
//           padding:
//               EdgeInsets.only(left: devWidth * 0.02, right: devWidth * 0.02),
//           children: [
//             TextFieldScreen(hintText: "Created by"),
//             TextFieldScreen(hintText: "Crop type"),
//             TextFieldScreen(hintText: "Crop name"),
//             ListTile(
//               title: Text("Add image"),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SizedBox(
//                   width: devWidth * 0.35,
//                   height: devHeight * 0.06,
//                   child: ElevatedButton.icon(
//                       style: ButtonStyle(
//                           shape: MaterialStatePropertyAll(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                           backgroundColor:
//                               MaterialStatePropertyAll(Color(0xFFd6ebdc))),
//                       onPressed: () {},
//                       icon:
//                           Icon(Icons.camera_alt_outlined, color: Colors.black),
//                       label: Text(
//                         'Camera',
//                         style: TextStyle(color: Colors.black),
//                       )),
//                 ),
//                 SizedBox(
//                   width: devWidth * 0.35,
//                   height: devHeight * 0.06,
//                   child: ElevatedButton.icon(
//                       style: ButtonStyle(
//                           shape: MaterialStatePropertyAll(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                           backgroundColor:
//                               MaterialStatePropertyAll(Color(0xFFd6ebdc))),
//                       // onPressed: () =>
//                       //     upload("gallery"),
//                       onPressed: () {},
//                       icon: Icon(Icons.photo, color: Colors.black),
//                       label: Text('Gallery',
//                           style: TextStyle(color: Colors.black))),
//                 ),
//               ],
//             ),
//             TextFieldScreen(hintText: "Price"),
//             TextFieldScreen(hintText: "Quantity"),
//             TextFieldScreen(
//               hintText: "Description",
//             ),
//             TextFieldScreen(hintText: "Is available"),
//             MaterialButtonWidget(onPressed: (){},
//               buttonText: "Add",
//               buttonColor: ColorConstants.primaryColor,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// /*
// /// Todo
// material button modification, textfield modification
// image add akumbol ulla space
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../global_widgets/image_icon_button.dart';
import '../../../../global_widgets/matterial_button_widget.dart';
import '../../../../global_widgets/textfield.dart';
import '../controller/add_harvested_item_controller.dart';

class AddHarvestedItemScreen extends StatefulWidget {
  const AddHarvestedItemScreen({Key? key}) : super(key: key);

  @override
  State<AddHarvestedItemScreen> createState() => _AddHarvestedItemScreenState();
}

class _AddHarvestedItemScreenState extends State<AddHarvestedItemScreen> {
  var createdByController = TextEditingController();
  var cropTypeController = TextEditingController();
  var cropNameController = TextEditingController();
  var priceController = TextEditingController();
  var quantityController = TextEditingController();
  var descriptionController = TextEditingController();
  var isAvailableController = TextEditingController();
  File? image;
  String _selectedName = "Fruits";

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add harvested item"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(top: devHeight * 0.04),
        child: ListView(
          padding:
              EdgeInsets.only(left: devWidth * 0.02, right: devWidth * 0.02),
          children: [
            TextFieldScreen(
              hintText: "Farmer Name",
              controller: createdByController,
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: devWidth * 0.1),
            //   child: DropdownButton<String>(
            //     value: _selectedName,
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         _selectedName = newValue!;
            //       });
            //     },
            //     items: <String>["Fruits", "Vegetables","Grains"].map((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(value),
            //       );
            //     }).toList(),                  ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: devWidth * 0.02, vertical: devHeight * 0.01),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  // Adjust border color here
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust border radius here
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  value: _selectedName,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedName = newValue!;
                    });
                  },
                  style: TextStyle(
                    color: Colors.black, // Adjust text color here
                    fontSize: 16.0, // Adjust font size here
                  ),
                  items: <String>["Fruits", "Vegetables", "Grains"]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),

            TextFieldScreen(
              hintText: "Crop name",
              controller: cropNameController,
            ),
            ListTile(
              title: Text("Add image"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageIconButton(
                    width: devWidth * 0.35,
                    height: devHeight * 0.06,
                    onPressed: () => _getImage(ImageSource.camera),
                    // onPressed: _getImage(ImageSource.camera),
                    icon: Icons.camera_alt_outlined,
                    label: 'Camera'),
                ImageIconButton(
                    width: devWidth * 0.35,
                    height: devHeight * 0.06,
                    onPressed: () => _getImage(ImageSource.gallery),
                    icon: Icons.photo,
                    label: 'Gallery'),
              ],
            ),
            image != null
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    width: 200,
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  )
                : SizedBox(),
            TextFieldScreen(
              hintText: "Price",
              keyBoardType: TextInputType.number,
              controller: priceController,
            ),
            TextFieldScreen(
              hintText: "Quantity",
              keyBoardType: TextInputType.number,
              controller: quantityController,
            ),
            TextFieldScreen(
              hintText: "Description",
              controller: descriptionController,
            ),
            TextFieldScreen(
              hintText: "Is available",
              controller: isAvailableController,
            ),
            MaterialButtonWidget(
              onPressed: () {
                Provider.of<AddHarvestedItemController>(context, listen: false)
                    .onAdd(
                  createdBy: createdByController.text,
                  cropType: _selectedName,
                  cropName: cropNameController.text,
                  price: double.parse(priceController.text),
                  quantity: int.parse(quantityController.text),
                  description: descriptionController.text,
                  // imageToAdd: image
                  isAvailable: isAvailableController.text,
                );
                // createdByController.clear();
                // cropTypeController.clear();
                // cropNameController.clear();
                // priceController.clear();
                // quantityController.clear();
                // descriptionController.clear();
                // isAvailableController.clear();

                print("api add completed");
              },
              buttonText: "Add",
              buttonColor: ColorConstants.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
