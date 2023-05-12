

import 'package:get/get.dart';

class BottomNController extends GetxController {

  var selectedIndex=0.obs;
  void onTabtapped(int index )
  {

    selectedIndex.value=index;



  }








}