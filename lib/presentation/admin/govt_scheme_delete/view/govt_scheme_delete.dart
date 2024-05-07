import 'package:cropmate/global_widgets/admin_widgets/govt_scheme_admin.dart';
import 'package:cropmate/repository/helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/govt_scheme_screen/controller/govt_scheme_controller.dart';

class GovtSchemeDeleteScreen extends StatefulWidget {
  const GovtSchemeDeleteScreen({Key? key});

  @override
  State<GovtSchemeDeleteScreen> createState() => _GovtSchemeDeleteScreenState();
}

class _GovtSchemeDeleteScreenState extends State<GovtSchemeDeleteScreen> {
  @override
  void initState() {
    Provider.of<GovtSchemeController>(context, listen: false)
        .fetchGovtSchemes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Govt Scheme's Admin View"),
      ),
      body: Consumer<GovtSchemeController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.govtSchemeModel.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return GovtSchemeAdminCard(
                  title: controller.govtSchemeModel.data?[index].schemeName
                          .toString() ??
                      '',
                  description: controller
                          .govtSchemeModel.data?[index].description
                          .toString() ??
                      '',
                  link:
                      controller.govtSchemeModel.data?[index].link.toString() ??
                          '',
                  startAge: controller.govtSchemeModel.data?[index].startAge
                          .toString() ??
                      '',
                  endAge: controller.govtSchemeModel.data?[index].endAge
                          .toString() ??
                      '',
                  delete: () async {
                    final schemeId = controller.govtSchemeModel.data?[index].id;
                    final endPoint = 'cropmapp/schemeupdate/$schemeId';
                    final response =
                        await ApiHelper.deleteData(endPoint: endPoint);

                    if (!response['status'] == 1) {
                      controller.fetchGovtSchemes();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(response['status'].toString()),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
