import 'dart:async';

import 'package:flutter/material.dart';

class DoctorReport extends StatefulWidget {
  final String Doctor;
  final String url;
  final String spec;
  final String Lastvis;

  const DoctorReport(
      {required this.Doctor,
      required this.url,
      required this.spec,
      required this.Lastvis});

  @override
  State<DoctorReport> createState() => _DoctorReportState();
}

class _DoctorReportState extends State<DoctorReport> {
  var selectindex = -1;
  List datas = [
    {
      "Day": "SriRam",
      "ReportNo": "General Doctor",
      "date": "No",
    },
    {
      "title": "Shuba",
      "spec": "ENT Doctor",
      "Specialist": "Yes",
      "LastVis": "01/10/2022",
      "descrption": "To check your Ear nose \n\t\t related problems",
      "imgurl": "assets/images/doctor2.png"
    },
    {
      "title": "Barath",
      "spec": "Skin Doctor",
      "Specialist": "No",
      "LastVis": "22/10/2022",
      "descrption": "To check your skin \n related problems",
      "imgurl": "assets/images/doctor3.png"
    },
    {
      "title": "Jessey",
      "spec": "Eye Doctor",
      "Specialist": "Yes",
      "LastVis": "11/09/2022",
      "descrption": "To check your eye \n related problems",
      "imgurl": "assets/images/doctor4.png"
    },
  ];
  int activeIndex = 0;
  int currentIndex = 0;
  Icon customicon = const Icon(Icons.search);
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;
        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
                    Text(
                      "Report By ${widget.Doctor}",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.picture_as_pdf)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.online_prediction_outlined)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
