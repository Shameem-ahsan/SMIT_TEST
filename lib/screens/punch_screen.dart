import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


void main() => runApp(punch_screen());

class punch_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => punch_screenPage();




}

class punch_screenPage extends State<punch_screen> {
  String timeText;




@override
  void initState() {
    // TODO: implement initState
    super.initState();
    runMyTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Container(
            // child: IconButton(icon: SvgPicture.asset('images/info.svg'), onPressed: null)
          height: 250,
          child: Row(
            children: [
              Expanded(child:
              Center(
                child: Text("Punch in",style: TextStyle(color: Colors.grey,fontSize:14,fontWeight: FontWeight.bold ,),),
              )),
              Expanded(child: AspectRatio(
                aspectRatio: 1,
                child: InkWell(
                  onTap: (){
                    //Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(145))
                    ),


                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green
                      ),
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(timeText??"",style: TextStyle(color: Colors.white),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            child: Divider(height: 2,color: Colors.white,),
                          ),

                          Text("Punch \nIn",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                        ],
                      ),

                    ),
                  ),
                ),
              ),flex: 2,),
              Expanded(child:
              Center(
                child: Text("Punch out",style: TextStyle(color: Colors.grey,fontSize:14,fontWeight: FontWeight.bold ,),),
              )),            ],
          ),
        ),
      ),
    );
  }

  void runMyTimer() {
    final DateFormat formatter = DateFormat('hh:mm a');
    const oneSec = const Duration(milliseconds:100);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {

        final String formatted = formatter.format(DateTime.now());
      timeText=formatted;
      });
    });
  }


}
