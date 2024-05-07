import 'dart:math';

import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/presentation/common/govt_scheme_screen/controller/govt_scheme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GovtSchemeAdminCard extends StatelessWidget {
  final String title;
  final String description;
  final String link;
  final String startAge;
  final String endAge;
  final VoidCallback delete;

  const GovtSchemeAdminCard({
    super.key,
    required this.title,
    required this.description,
    required this.link,
    required this.startAge,
    required this.endAge,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 4),
      child: SizedBox(
        height: devHeight * .25,
        child: Card(
          color: ColorConstants.lightGreenColor,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        " Start Age :$startAge",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "End Age :$endAge",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  IconButton(onPressed: delete, icon: Icon(Icons.delete))
                ],
              ),
              InkWell(
                onTap: () {
                  Provider.of<GovtSchemeController>(context, listen: false)
                      .launchURL(link);
                },
                child: Text(
                  link,
                  maxLines: 1,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.blue),
                ),
              ),
              Text(
                description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
