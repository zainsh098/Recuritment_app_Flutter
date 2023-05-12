import 'package:flutter/material.dart';


class JobSeeker_ProfileShow extends StatefulWidget {
  const JobSeeker_ProfileShow({Key? key}) : super(key: key);

  @override
  State<JobSeeker_ProfileShow> createState() => _JobSeeker_ProfileShowState();
}

class _JobSeeker_ProfileShowState extends State<JobSeeker_ProfileShow> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child:

            Column(

              children: [

               Table(
                 defaultColumnWidth: FixedColumnWidth(85),
                 border: TableBorder.all(
                   color: Colors.black,
                   width: 2,
                   style: BorderStyle.solid,


                 ),
                 children: [

                   TableRow(
                     children: [
                       Column(children: [Text("Age ")],),
                       Column(children: [Text("Education ")],),
                       Column(children: [Text("Work Experience ",textAlign: TextAlign.center,)],),
                       Column(children: [Text("Skills ")],),


                     ],


                   ),






                 ],



               ),






              ],




            ),







          ),






        ],




      ),



    );
  }
}
