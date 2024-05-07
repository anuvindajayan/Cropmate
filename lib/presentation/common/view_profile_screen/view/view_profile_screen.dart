import 'package:cropmate/presentation/common/view_profile_screen/controller/view_profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  fetchData(BuildContext context) {
    Provider.of<ViewProfileController>(context, listen: false)
        .fetchProfileData(context);
  }

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:
            Text("View Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Consumer<ViewProfileController>(builder: (context, controller, _) {
        return controller.isLoading == true
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Name        :${controller.profileModel.data?.username}",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "Email         :${controller.profileModel.data?.email}",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "Phone        :${controller.profileModel.data?.phone}",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "Location    :${controller.profileModel.data?.location}",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "Address     :${controller.profileModel.data?.address},",
                          style: TextStyle(fontSize: 25),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // ViewProfileWidget(value: "${controller.profileModel.data?.location}", id: "Location")
                        // ManagementCard(name: "Name", email: "${controller.profileModel.data?.email}", onCardClick: (){})
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
