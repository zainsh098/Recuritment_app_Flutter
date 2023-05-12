import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visio_revised/Employeee/CompnayInformationAdd.dart';
import 'package:visio_revised/Employeee/EmployeeRegistraionForm.dart';

import '../Controllers/BottomNavigationController.dart';

class EmployeeHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(





      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
            "Home",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          50.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: "Company Information"
                .text
                .fontWeight(FontWeight.bold)
                .size(15)
                .make(),
          ),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                InkWell(
                  onTap:(){

                    Get.to(() => CompanyInformationAdd());

          },
                  child: Container(
                    height: 130,
                    width: 130,
                    child: Center(
                        child: Image.asset(
                      'assets/images/addCompany.png',
                      height: 80,
                    )),
                    decoration: BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
