import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/colors.dart';




class CandidateSelectionPage extends StatelessWidget {
  const CandidateSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             20.heightBox,
            
            Row(
              children:  [
               IconButton(onPressed: () {

               }, icon: Icon(Iconsax.arrow_left,size: 33,color: Colors.blueGrey,))
                
                
                
              ],
              
              
              
            ),
            
            30.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Hello Candidate!",style: TextStyle(

                //Heading 2
                fontFamily: 'CircularStd-Medium',
                fontSize: 32,
                color: Colors.black,

              ),),
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Welcome to Batqah an app which helps you find \n"
                  " awesome opportunities by companies",style: TextStyle(
                //Body
                fontFamily: 'CircularStd-Medium',
                fontSize: 13,
                color: Colors.grey.shade600,
              ),),
            ),
            20.heightBox,

            Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.grey.shade400,


            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Already Have an Account?",style: TextStyle(
                //Body
                fontFamily: 'CircularStd-Book',
                fontSize: 13,
                color: Colors.grey.shade600,
              ),),
            ),
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
                  primary: Colors.blue,
                  elevation: 20,
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


