import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/global_widgets/admin_widgets/management_card.dart';
import 'package:cropmate/presentation/admin/user_management_screen/controller/user_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../global_widgets/admin_widgets/details_bottom_sheet.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<UserManagementController>(context, listen: false);
    provider.fetchUserList();
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
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
                if (userData?.userType.toString() == 'UserType.USER') {
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
