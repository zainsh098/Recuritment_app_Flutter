import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visio_revised/Constants/colors.dart';

class Boarding extends StatelessWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Container(
      decoration: BoxDecoration(
        gradient: gradientColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            50.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  height: 70,
                  width: 70,
                ),
                15.widthBox,
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Btaqah",
                    style: TextStyle(

                        //Heading 1
                        fontFamily: 'CircularStd-Medium',
                        fontSize: 32,
                        color: GreyLite),
                  ),
                ),
              ],

            ),
              25.heightBox,
           Divider(
             height: 20,
             thickness: 2,
             indent: 160,
             endIndent: 160,
             color: GreyLite,


           ),
25.heightBox,

            Text("Welcome To Btaqah",style: TextStyle(

              //Heading 2
              fontFamily: 'CircularStd-Medium',
              fontSize: 28,
              color: GreyLite,

            ),),

            25.heightBox,
            Image.asset(
              'assets/images/user.png',
              height: 30,
              width: 30,
            ),
           20.heightBox,




            Text("I am  looking to create my profile and \n"
                "looking for a potential job ",textAlign: TextAlign.center,style: TextStyle(
              //sub-Heading
              fontFamily: 'CircularStd-Book',
              fontSize: 17,
              color: GreyLite,

            ),),
            20.heightBox,
            SizedBox(
              height: 50,
              width: 300,

              child: ElevatedButton(onPressed: () {

              }, child: Text("YES, I AM A CANDIDATE ",textAlign: TextAlign.center,style: TextStyle(
                //sub-Heading
                fontFamily: 'CircularStd-Book',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color:Blue1,

              ),),
                style: ElevatedButton.styleFrom(
                primary: GreyLite,
                    elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),



              ),

            ),
            20.heightBox,
            Image.asset(
              'assets/images/company.png',
              height: 35,
              width: 35,
            ),
            20.heightBox,




            Text("I am  looking to hire awesome  \n"
                "people for my company",textAlign: TextAlign.center,style: TextStyle(
              //sub-Heading
              fontFamily: 'CircularStd-Book',
              fontSize: 17,
              color: GreyLite,

            ),),
            20.heightBox,
            SizedBox(
              height: 50,
              width: 300,

              child: ElevatedButton(onPressed: () {

              }, child: Text("YES, I AM A RECRUITER ",textAlign: TextAlign.center,style: TextStyle(
                //sub-Heading
                fontFamily: 'CircularStd-Book',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color:GreyLite,

              ),),
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                  primary: Colors.teal.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),

                  ),
                ),



              ),

            ),






          ],
        ),
      ),
    );
  }
}
