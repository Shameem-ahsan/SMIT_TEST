import 'package:flutter/material.dart';


import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(profile_screen());

class profile_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => profile_screenPage();
}

class profile_screenPage extends State<profile_screen> {


  PickedFile _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
 String _retrieveDataError;

  final ImagePicker _picker = ImagePicker();

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    final pickedFile = await _picker.getImage(
      source: source,
      // maxWidth: maxWidth,
      // maxHeight: maxHeight,
      // imageQuality: quality,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          
      Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              height: 140,
              width: 140,
              // color: Colors.blue,
              child: Stack(
                children: [
                  Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        image: DecorationImage(
                          image:_imageFile!=null?FileImage(File(_imageFile.path)):AssetImage("images/info.svg"),
                          fit: BoxFit.cover,
                        )
                      ),),
                      // child:_imageFile!=null? ):Text("Select image")),
                  Align(
                      alignment: Alignment(.8, .8),
                      child: InkWell(
                        onTap: ()=>_onImageButtonPressed(ImageSource.gallery),
                        child: Container(
                          child: Icon(Icons.camera_alt),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Color(0xfff8f8f8),shape: BoxShape.circle),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(  height: 10, ),
            Text("Shameem",style: TextStyle(color: Colors.grey,fontSize:22,fontWeight: FontWeight.bold ,),),
            SizedBox(  height: 10, ),
            Text("Mobile Application Developer", style: TextStyle(color: Colors.grey,fontSize:20 ),),
            SizedBox(  height: 10, ),
            Text("Calicut , kerala",style: TextStyle(color: Colors.grey,fontSize:20 ),),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2)
                  ),
                  child: Column(
                    children: [


                      IconButton(icon: SvgPicture.asset('images/info.svg'), onPressed: null),
                      Text("About",style: TextStyle(color: Colors.blue,fontSize:14 ),),

                    ],
                  ),


                ),

                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2)
                  ),
                  child: Column(
                    children: [


                      IconButton(icon: SvgPicture.asset('images/settings.svg'), onPressed: null),
                      Text("Settings",style: TextStyle(color: Colors.blue,fontSize:14 ),),

                    ],
                  ),


                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 2)
              ),
              child: Column(
                children: [


                  IconButton(icon: SvgPicture.asset('images/logout.svg'), onPressed: null),
                  Text("Logout",style: TextStyle(color: Colors.red,fontSize:14 ),),

                ],
              ),


            )




          ],
        ),
      ),
    );
  }
}
