import 'package:ecocredit/services/widget_support.dart';
import 'package:flutter/material.dart';

class UploadItem extends StatefulWidget {
  const UploadItem({super.key});

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Row(

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
                    child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
                  ),
                ),
                Text("Upload Item",style: AppWidget.headlineTextstyle(22.0),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
