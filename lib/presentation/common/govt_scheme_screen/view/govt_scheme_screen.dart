
import 'package:cropmate/global_widgets/govt_scheme_card.dart';
import 'package:cropmate/presentation/common/govt_scheme_screen/controller/govt_scheme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GovtSchemeScreen extends StatelessWidget {
  const GovtSchemeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<GovtSchemeController>(context, listen: false);
    controller.fetchGovtSchemes();
    return Scaffold(
      appBar: AppBar(
        title: Text("Govt Scheme's"),
      ),
      body: Consumer<GovtSchemeController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.govtSchemeModel.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return GovtSchemeCard(
                    title: controller.govtSchemeModel.data?[index].schemeName
                            .toString() ??
                        '',
                    description: controller
                            .govtSchemeModel.data?[index].description
                            .toString() ??
                        '',
                    link: controller.govtSchemeModel.data?[index].link
                            .toString() ??
                        '',
                    startAge: controller.govtSchemeModel.data?[index].startAge
                            .toString() ??
                        '',
                    endAge: controller.govtSchemeModel.data?[index].endAge
                            .toString() ??
                        '');
              },
            );
          }
        },
      ),
    );
  }
}

