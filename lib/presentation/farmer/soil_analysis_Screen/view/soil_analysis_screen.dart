
import 'package:cropmate/presentation/farmer/soil_analysis_Screen/controller/soil_analysis_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../global_widgets/matterial_button_widget.dart';
import '../../../../global_widgets/textfield.dart';

class SoilAnalysisScreen extends StatefulWidget {
  @override
  State<SoilAnalysisScreen> createState() => _SoilAnalysisScreenState();
}

class _SoilAnalysisScreenState extends State<SoilAnalysisScreen> {
  // const SoilAnalysisScreen({super.key});
  var nCont = TextEditingController();

  var pCont = TextEditingController();

  var kCont = TextEditingController();

  var tempCont = TextEditingController();

  var humidityCont = TextEditingController();

  var phCont = TextEditingController();

  var rainCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Soil Analysis and Crop Recommendation"),
        //centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(top: devHeight * 0.04),
        child: ListView(
          padding:
              EdgeInsets.only(left: devWidth * 0.02, right: devWidth * 0.02),
          children: [
            TextFieldScreen(
              hintText: "Nitrogen content",
              controller: nCont,
              keyBoardType: TextInputType.number,
            ),
            TextFieldScreen(
              hintText: "Potassium content",
              controller: pCont,
              keyBoardType: TextInputType.number,
            ),
            TextFieldScreen(
              hintText: "Phosphorus content",
              controller: kCont,
              keyBoardType: TextInputType.number,
            ),
            TextFieldScreen(
              hintText: "Temperature",
              controller: tempCont,
              keyBoardType: TextInputType.number,
            ),
            TextFieldScreen(
              hintText: "Humidity",
              controller: humidityCont,
              keyBoardType: TextInputType.number,
            ),
            TextFieldScreen(
              hintText: "Ph",
              controller: phCont,
              keyBoardType: TextInputType.number,
            ),
            TextFieldScreen(
              hintText: "Rainfall",
              controller: rainCont,
              keyBoardType: TextInputType.number,
            ),
            SizedBox(
              height: devHeight * 0.03,
            ),
            MaterialButtonWidget(
              onPressed: () async {
                SoilAnalysisController soilController =
                    Provider.of<SoilAnalysisController>(context, listen: false);
                await soilController.getSoilReport(
                  N: int.parse(nCont.text),
                  P: int.parse(pCont.text),
                  K: int.parse(kCont.text),
                  temp: double.parse(tempCont.text),
                  humidity: double.parse(humidityCont.text),
                  pH: double.parse(phCont.text),
                  rain: double.parse(rainCont.text),
                  context: context,
                );
                nCont.clear();
                phCont.clear();
                kCont.clear();
                tempCont.clear();
                humidityCont.clear();
                rainCont.clear();
                phCont.clear();
              },

              /*
              onPressed: () {
                Provider.of<SoilAnalysisController>(context, listen: false)
                    .getSoilReport(
                        N: int.parse(nCont.text),
                        P: int.parse(pCont.text),
                        K: int.parse(kCont.text),
                        temp: double.parse(tempCont.text),
                        humidity: double.parse(humidityCont.text),
                        pH: double.parse(phCont.text),
                        rain: double.parse(rainCont.text),
                        context: context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(Provider.of<SoilAnalysisController>(context,
                              listen: false)
                          .message
                          .toString())),
                );

                // AppUtils.oneTimeSnackBar(
                //     Provider.of<SoilAnalysisController>(context).message.toString(),
                //     context: context);
              },
              */
              buttonText: "Check",
              buttonColor: ColorConstants.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
