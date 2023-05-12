import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visio_revised/FlutterToast.dart';

import 'ProfileShow_JobSeeker.dart';




class JobSeekerProfileMaker extends StatefulWidget {
  const JobSeekerProfileMaker({Key? key}) : super(key: key);

  @override
  State<JobSeekerProfileMaker> createState() => _JobSeekerProfileMakerState();
}

class _JobSeekerProfileMakerState extends State<JobSeekerProfileMaker> {

  bool _isLoading=false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _workExperienceController = TextEditingController();
  final TextEditingController _Age = TextEditingController();
  final TextEditingController _ExpectedSalaryController = TextEditingController();

  FirebaseDatabase _firebaseDatabase=FirebaseDatabase.instance;

  void _Insertdata() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final  databaseRef;
      databaseRef=   _firebaseDatabase.ref('Job_Seeker_ProfileData');
      String id=DateTime.now().microsecondsSinceEpoch.toString();

      await   databaseRef.child(id).set({

        "Id ": id,
        " Age ": _Age.text.toString(),
        "Education": _educationController.text.toString(),
        "Skills ": _skillsController.text.toString(),
        "Work Experience ": _workExperienceController.text.toString(),
      }
      );
      }on   FirebaseException catch(error)
    {
      flutterToast().toastMessage(error.toString());



    }
    setState(() {
      _isLoading=false;

      flutterToast().toastMessage("Database Submitted Success Fully ");

    });








      }



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    30.heightBox,

                    Form(
                        key: _formkey,

                        child: Column(

                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: _Age,
                                validator: (value){

                                  if(value==null || value.isEmpty){
                                    return " Please enter your Age";


                                  }
                                  return null;


                                },






                                keyboardType: TextInputType.text,
                                enabled: true,
                                cursorColor: Colors.black,
                                cursorHeight: 25,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blueGrey.shade50,
                                  hintText: "Age",
                                  prefixIcon: Icon(Icons.account_circle),
                                  focusColor: Colors.deepOrange,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            20.heightBox,
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(

                                controller: _educationController,

                                keyboardType: TextInputType.emailAddress,
                                enabled: true,
                                cursorColor: Colors.black,
                                cursorHeight: 25,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blueGrey.shade50,
                                  hintText: "Education",
                                  prefixIcon: Icon(Icons.email_outlined),
                                  focusColor: Colors.deepOrange,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            20.heightBox,
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(

                                controller: _skillsController,

                                keyboardType: TextInputType.text,
                                enabled: true,
                                cursorColor: Colors.black,
                                cursorHeight: 25,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blueGrey.shade50,
                                  hintText: "Skills",
                                  prefixIcon: Icon(Icons.password),
                                  focusColor: Colors.deepOrange,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            20.heightBox,
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(

                                controller: _workExperienceController,

                                keyboardType: TextInputType.text,
                                enabled: true,
                                cursorColor: Colors.black,
                                cursorHeight: 25,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blueGrey.shade50,
                                  hintText: "Work Experience",
                                  prefixIcon: Icon(Icons.password),
                                  focusColor: Colors.deepOrange,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),



                          ],



                        )),


                    10.heightBox,



                    //Elevated Button
                    SizedBox(
                        width: 300 - 50,
                        height: 100 - 50,
                        child: ClipPath(
                          clipper: ShapeBorderClipper(shape: Vx.rounded),
                          child: ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              if(_formkey.currentState!.validate())
                              {
                               _Insertdata();




                              }


                            },
                            child: _isLoading ? CircularProgressIndicator(

                            )
                                : Text(
                              "Submit Data ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),
                            ),

                          ),
                        )),
                    40.heightBox,
                    SizedBox(
                        width: 300 - 50,
                        height: 100 - 50,
                        child: ClipPath(
                          clipper: ShapeBorderClipper(shape: Vx.rounded),
                          child: ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => JobSeeker_ProfileShow(),));

                            },
                            child:  Text(
                              "See Submitted Data ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),
                            ),

                          ),
                        )),



                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
