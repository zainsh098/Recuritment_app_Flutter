import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visio_revised/FlutterToast.dart';
import 'package:visio_revised/Ui/SplashScreen/SplashScreen.dart';



class JobSeekerLogin extends StatefulWidget {
  const JobSeekerLogin({Key? key}) : super(key: key);

  @override
  State<JobSeekerLogin> createState() => _JobSeekerLoginState();
}

class _JobSeekerLoginState extends State<JobSeekerLogin> {

  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;



  bool _isLoading = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordontroller = TextEditingController();

final auth=FirebaseAuth.instance;

  void isLogin()
  {

  auth.signInWithEmailAndPassword(


     email : _emailController.text.toString(), password: _passwordontroller.text.toString(), ).then((value) {


    Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(),));
    flutterToast().toastMessage(value.user!.email.toString());
;
  }).onError((error, stackTrace) {
      debugPrint(error.toString());
    flutterToast().toastMessage(error.toString());



  });



}



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  30.heightBox,

                  Form(
                      key: _formkey,

                      child: Column(

                        children: [


                          20.heightBox,
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(

                              controller: _emailController,

                              keyboardType: TextInputType.emailAddress,
                              enabled: true,
                              cursorColor: Colors.black,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blueGrey.shade50,
                                hintText: "Email",
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

                              controller: _passwordontroller,

                              keyboardType: TextInputType.text,
                              enabled: true,
                              cursorColor: Colors.black,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blueGrey.shade50,
                                hintText: "Password",
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



                        ],



                      )),






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

                            isLogin();



                            }


                          },
                          child: _isLoading ? CircularProgressIndicator(



                          )
                              : Text(
                            "SignIn",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
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
    );
  }
}
