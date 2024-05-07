import 'package:flutter/material.dart';

class DetailsBottomSheet extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String location;
  final String address;

  DetailsBottomSheet({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.location,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return Container(
      height: devHeight * 0.3,
      width: devWidth,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Name: $name',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Phone Number: $phoneNumber',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Email: $email',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Location: $location',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Address: $address',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

