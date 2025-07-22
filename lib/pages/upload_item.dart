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
                      child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,size: 30.0,),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/5.5,
                  ),
                  Text("Upload Item",style: AppWidget.headlineTextstyle(25.0),),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Color(0xFFececf8),

              ),
              child: Column(
                children: [
                  Container(

                   height: 150,
                    width: 150,
                    decoration: BoxDecoration(

                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
