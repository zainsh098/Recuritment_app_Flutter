import 'dart:async';


import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visio_revised/Ui/WelcomeScreen/WelcomeScreen.dart';









class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void splash(BuildContext context)
  {
  Timer(Duration(seconds: 3), () {



    Navigator.push(context , MaterialPageRoute(builder:  (context) => WelcomeScreen(),));


  });


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash(context);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child: "Spalsh Screen".text.capitalize.fontWeight(FontWeight.bold).size(22).color(Colors.purple).make(),


          ),
          100.heightBox,



        ],


      ),



    );
  }
}






