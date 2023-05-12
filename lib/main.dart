import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visio_revised/BottomNavigation.dart';
import 'package:visio_revised/Employeee/CompnayInformationAdd.dart';
import 'package:visio_revised/Employeee/EmployeeHomePage.dart';
import 'package:visio_revised/Ui/SplashScreen/SplashScreen.dart';

import 'EditProfileScreen.dart';
import 'Ui/Boarding.dart';
import 'Ui/Candidate/Candidate_L/S Seltction.dart';
import 'Ui/Candidate/JobSeekerLogin.dart';
import 'Ui/WelcomeScreen/WelcomeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Flutter Recruitment APP',
      theme: ThemeData(


        primarySwatch: Colors.purple,
      ),
      home: WelcomeScreen(),
    );
  }
}
