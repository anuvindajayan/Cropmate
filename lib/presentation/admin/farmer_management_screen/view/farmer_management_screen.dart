import 'package:cropmate/global_widgets/admin_widgets/management_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../global_widgets/admin_widgets/details_bottom_sheet.dart';
import '../../user_management_screen/controller/user_management_controller.dart';

class FarmerManagementScreen extends StatelessWidget {
  const FarmerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Management'),
        centerTitle: true,
      ),
      body: Consumer<UserManagementController>(
        builder: (context, controller, child) {
          if (controller.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.userManage.data?.length ?? 0,
              itemBuilder: (context, index) {
                final userData = controller.userManage.data?[index];
                // print(userData?.userType);
                if (userData?.userType.toString() == 'UserType.FARMER') {
                  return ManagementCard(
                    name: userData?.username ?? '',
                    email: userData?.email ?? '',
                    onCardClick: () {
                      showModalBottomSheet(
                        backgroundColor: ColorConstants.lightGreenColor,
                        context: context,
                        builder: (BuildContext context) {
                          return DetailsBottomSheet(
                            name: userData?.username ?? '',
                            phoneNumber: userData?.phone ?? '',
                            location: userData?.location ?? '',
                            email: userData?.email ?? '',
                            address: userData?.address ?? '',
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Container(); // or any other widget you prefer
                }
              },
            );
          }
        },
      ),
    );
  }
}
