
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:visio_revised/Employeee/CompnayInformationAdd.dart';
import 'package:visio_revised/Employeee/EmployeeHomePage.dart';


import 'Ui/Candidate/ProfileShow_JobSeeker.dart';


class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void onTabTapped(int index) {
    selectedIndex.value = index;
  }
}

class MyHomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _getPage(controller.selectedIndex.value)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
    ),

          child: BottomNavigationBar(
            iconSize: 20,
             selectedItemColor: Colors.amber,
            


             elevation: 1,

            backgroundColor: Color.fromRGBO(48, 116, 218, 0.7294117647058823),
            unselectedItemColor: Colors.white.withOpacity(0.5),

            currentIndex: controller.selectedIndex.value,
            onTap: controller.onTabTapped,
            items: const [
              BottomNavigationBarItem(


                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return EmployeeHomePage();
      case 1:
        return CompanyInformationAdd();
      case 2:
        return JobSeeker_ProfileShow();
      default:
        return JobSeeker_ProfileShow();
    }
  }
}
