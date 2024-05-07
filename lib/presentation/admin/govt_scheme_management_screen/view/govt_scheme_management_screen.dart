import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/global_widgets/matterial_button_widget.dart';
import 'package:cropmate/global_widgets/textfield.dart';
import 'package:cropmate/presentation/admin/govt_scheme_delete/view/govt_scheme_delete.dart';
import 'package:cropmate/presentation/admin/govt_scheme_management_screen/controller/govt_scheme_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GovtSchemeManagementScreen extends StatelessWidget {
  // const GovtSchemeManagementScreen({super.key});
  var schemeNameController = TextEditingController();
  var startAgeController = TextEditingController();
  var endAgeController = TextEditingController();
  var descriptionController = TextEditingController();
  var linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Govt Scheme Management'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldScreen(
              hintText: 'Scheme Name',
              controller: schemeNameController,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFieldScreen(
                  hintText: 'Start age',
                  keyBoardType: TextInputType.number,
                  controller: startAgeController,
                )),
                Expanded(
                    child: TextFieldScreen(
                  hintText: 'End age',
                  keyBoardType: TextInputType.number,
                  controller: endAgeController,
                )),
              ],
            ),
            TextFieldScreen(
              hintText: 'Description',
              maxLines: 5,
              controller: descriptionController,
            ),
            TextFieldScreen(
              hintText: 'Link',
              controller: linkController,
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButtonWidget(
                buttonText: 'Add Scheme',
                onPressed: () {
                  Provider.of<GovtSchemeManagementController>(context,
                          listen: false)
                      .onGovtSchemeAdd(
                          schemeName: schemeNameController.text,
                          startAge: startAgeController.text,
                          endAge: endAgeController.text,
                          description: descriptionController.text,
                          link: linkController.text);
                  schemeNameController.clear();
                  startAgeController.clear();
                  endAgeController.clear();
                  descriptionController.clear();
                  linkController.clear();
                },
                buttonColor: ColorConstants.primaryColor),
            SizedBox(
              height: 20,
            ),
            MaterialButtonWidget(
              buttonColor: ColorConstants.primaryColor,
              buttonText: 'View Schemes',
              onPressed: () {
                //navigate to admin govt scheme view
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GovtSchemeDeleteScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
