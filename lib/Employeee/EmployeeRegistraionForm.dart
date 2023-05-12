import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visio_revised/FlutterToast.dart';


import '../Ui/Candidate/JobSeekerLogin.dart';

class EmployeeRegistrationForm extends StatefulWidget {
  const EmployeeRegistrationForm({Key? key}) : super(key: key);

  @override
  State<EmployeeRegistrationForm> createState() =>
      _EmployeeRegistrationFormState();
}

class _EmployeeRegistrationFormState extends State<EmployeeRegistrationForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordontroller = TextEditingController();

  bool _isLoading = false;

  void _submitSignupForm() async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordontroller.text,
      );

      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance
            .collection("Employeer_signupData")
            .doc(user.uid)
            .set({
          "name": _nameController.text.trim(),
          "email": _emailController.text.trim(),
          "password": _passwordontroller.text.trim(),
        });
      }
    } on FirebaseAuthException catch (error) {
      flutterToast().toastMessage(error.toString());
    }
    setState(() {
      _isLoading = false;

      flutterToast().toastMessage("Signup Done");
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
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return " Please enter your name";
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
                                hintText: "Name",
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
                            if (_formkey.currentState!.validate()) {
                              _submitSignupForm();
                            }
                          },
                          child: _isLoading
                              ? CircularProgressIndicator()
                              : const Text(
                                  "Signup",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0),
                                ),
                        ),
                      )),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont Have Account ",
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => JobSeekerLogin(),
                                ));
                          },
                          child: "Login"
                              .text
                              .size(22)
                              .fontWeight(FontWeight.bold)
                              .color(Colors.blue)
                              .make())
                    ],
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
