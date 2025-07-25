import 'dart:io';

import 'package:ecocredit/services/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadItem extends StatefulWidget {
  String category,id;
  UploadItem({required this.category, required this.id});

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {

  final ImagePicker _picker=ImagePicker();
  File? selectedImage;

  Future getImage()async{
    var image=await _picker.pickImage(source: ImageSource.gallery);
    selectedImage=File(image!.path);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(60),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 5.5),
                  Text("Upload Item", style: AppWidget.headlineTextstyle(25.0)),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color(0xFFececf8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.0),
                    Center(
                      child: Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black45, width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.camera_alt_outlined, size: 30),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Enter you address you want your item to be picked",
                        style: AppWidget.normalTextstyle(18.0),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                              hintText: "Enter Address",
                              hintStyle: AppWidget.normalTextstyle(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Enter the quantity of the Item to be picked",
                        style: AppWidget.normalTextstyle(18.0),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.production_quantity_limits,
                                color: Colors.green,
                              ),
                              hintText: "Enter Quantity",
                              hintStyle: AppWidget.normalTextstyle(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0,),
                    Center(
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width/1.5,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: Text("Upload",style: AppWidget.whiteTextstyle(26.0),)),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
