import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:visio_revised/Employeee/EmployeeHomePage.dart';
import 'package:visio_revised/Employeee/EmployeeRegistraionForm.dart';
import 'package:visio_revised/generated/assets.dart';

class CompanyInformationAdd extends StatefulWidget {
  const CompanyInformationAdd({Key? key}) : super(key: key);

  @override
  State<CompanyInformationAdd> createState() => _CompanyInformationAddState();
}

class _CompanyInformationAddState extends State<CompanyInformationAdd> {
  File? _image;
  final picker = ImagePicker();
  String? _imageUrl;
  String? image;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadData() async {
    if (_formKey.currentState!.validate()) {
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('images/${_image!.path.split('/').last}');
      final UploadTask uploadTask = storageRef.putFile(_image!);
      await uploadTask.whenComplete(() async {
        _imageUrl = await storageRef.getDownloadURL();
        FirebaseFirestore.instance.collection('data').add({
          'title': _titleController.text,
          'description': _descriptionController.text,
          'image_url': _imageUrl,
        });
        setState(() {}); // update UI to show the uploaded image
      });
      // Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = _imageUrl;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
           Text(" ",style: TextStyle(

             //Heading 1
             fontFamily: 'CircularStd-Bold',
             fontSize: 32,

           ),),

              Text("",style: TextStyle(

                //Heading 2
                fontFamily: 'CircularStd-Medium',
                fontSize: 28,

              ),),




              Text("",style: TextStyle(
                //sub-Heading
                fontFamily: 'CircularStd-Book',
                fontSize: 24,

              ),),

              Text("",style: TextStyle(
                //Body
                fontFamily: 'CircularStd-Book',
                fontSize: 18,

              ),),
              Text("",style: TextStyle(
                //Hint
                fontFamily: 'CircularStd-Book',
                fontSize: 12,

              ),),













              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          

                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 50,
                                // if no image was picked, do not display any image
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: IconButton(
                                  iconSize: 35,
                                  color: Colors.green,
                                  onPressed: () {
                                    getImage();
                                  },
                                  icon: Icon(Icons.add_a_photo),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: TextFormField(
                              controller: _titleController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter company name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              enabled: true,
                              cursorColor: Colors.black,
                              cursorHeight: 25,
                              decoration: const InputDecoration(
                                filled: true,
                                enabled: true,
                                hintText: 'Company Name',
                                prefixIcon: Icon(Icons.account_circle),
                                focusColor: Colors.deepOrange,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: TextFormField(
                              controller: _descriptionController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter company description';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              maxLines: null,
                              enabled: true,
                              cursorColor: Colors.black,
                              cursorHeight: 25,
                              decoration: const InputDecoration(
                                filled: true,

                                enabled: true,
                                hintText: 'Company Description',
                                prefixIcon: Icon(Icons.description),
                                focusColor: Colors.deepOrange,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: TextFormField(
                              maxLines: 3,
                              controller: _titleController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Company Site Link';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              enabled: true,
                              cursorColor: Colors.black,
                              cursorHeight: 25,
                              decoration: const InputDecoration(
                                filled: true,
                                enabled: true,
                                hintText: 'Company Website URL',
                                focusColor: Colors.deepOrange,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                uploadData();

                                Get.defaultDialog(
                                  title: "Company Information",
                                  content:
                                      Text("Profile Data Saved Succesfully "),
                                  radius: 20,
                                  backgroundColor: Colors.blueGrey.shade50,
                                );
                                Future.delayed(Duration(milliseconds: 900), () {
                                  Get.back();
                                  Get.to(() => EmployeeHomePage());

                                  // Navigate to another page here.
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              child: const Text('Saved Profile'),
                            ),
                          ),
                        ],
                      ),
                    ),
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
