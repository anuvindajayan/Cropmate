import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/global_widgets/image_icon_button.dart';
import 'package:cropmate/global_widgets/matterial_button_widget.dart';
import 'package:cropmate/presentation/common/plant_disease_result_screen/view/plant_disease_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PlantDiseasePredictionScreen extends StatefulWidget {
  const PlantDiseasePredictionScreen({Key? key}) : super(key: key);

  @override
  _PlantDiseasePredictionScreenState createState() =>
      _PlantDiseasePredictionScreenState();
}

class _PlantDiseasePredictionScreenState
    extends State<PlantDiseasePredictionScreen> {
  late ImagePicker _imagePicker;
  XFile? _selectedImage;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _getImageFromCamera() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    _setImage(image);
  }

  // Function to get image from gallery
  Future<void> _getImageFromGallery() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    _setImage(image);
  }

  void _setImage(XFile? image) {
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  Future<void> _predictDisease() async {
    try {
      var imageUrl = "http://10.11.0.227:8000/cropmapp/predict/";//apputils pinne use chyanm

      // Check if an image is selected
      if (_selectedImage == null) {
        // Handle the case where no image is selected
        return;
      }

      // Perform image upload and prediction
      var response = await onUploadImage(imageUrl);

      // Handle the response
      if (response.statusCode == 200) {
        // Image upload successful
        // You can handle the response data here
        print("Image uploaded successfully!");
        result = jsonDecode(response.body);
        log(result["data"]["class_name"]);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlantDiseaseResultScreen(
                      className: result['data']['class_name'],
                      result: result['data']['solution'],
                    )));
      } else {
        // Image upload failed
        // You can handle the error here
        print("Image upload failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any exceptions
      print("Error occurred: $e");
    }
  }

  // Function to upload the selected image
  Future<http.Response> onUploadImage(String url) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};

    // Check if _selectedImage is not null before using it
    if (_selectedImage != null) {
      // Get the file from the XFile
      File file = File(_selectedImage!.path);

      // Read the file contents asynchronously
      List<int> fileBytes = await file.readAsBytes();

      // Add the file to the request
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          fileBytes,
          filename: _selectedImage!.path.split('/').last,
        ),
      );
    }

    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    return await http.Response.fromStream(res);
  }

  Map<String, dynamic> result = {};

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Disease Prediction"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(top: devHeight * 0.02),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Add image",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: ColorConstants.blackColor),
              ),
            ),
            SizedBox(height: devHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageIconButton(
                    width: devWidth * 0.35,
                    height: devHeight * 0.06,
                    onPressed: _getImageFromCamera,
                    icon: Icons.camera_alt_outlined,
                    label: 'Camera'),
                ImageIconButton(
                    width: devWidth * 0.35,
                    height: devHeight * 0.06,
                    onPressed: _getImageFromGallery,
                    icon: Icons.photo,
                    label: 'Gallery'),
              ],
            ),
            SizedBox(height: devHeight * 0.02),
            if (_selectedImage != null)
              Padding(
                padding: EdgeInsets.all(devWidth * 0.02),
                child: Image.file(
                  File(_selectedImage!.path),
                  height: devHeight * 0.3,
                  width: devWidth,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: devHeight * 0.02),
            MaterialButtonWidget(
              onPressed: _predictDisease,
              buttonText: 'Predict Disease',
              buttonColor:
                  ColorConstants.primaryColor, // Set your desired button color
            ),
          ],
        ),
      ),
    );
  }
}
