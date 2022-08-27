import 'package:flutter/material.dart';
import 'package:medicalpat/DoctorsPage/data.dart';
import 'package:medicalpat/DoctorsPage/doclistmodel.dart';
import 'package:medicalpat/DoctorsPage/widgets/doctor_description.dart';
import 'package:medicalpat/DoctorsPage/widgets/doctor_image.dart';

class DoctorScreen extends StatelessWidget {
  final Data doctorInformationModel;

  DoctorScreen({
    Key? key,
    required this.doctorInformationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorImage(doctorInformationModel: doctorInformationModel),
              DoctorDescription(doctorInformationModel: doctorInformationModel),
            ],
          ),
        ),
      ),
    );
  }
}
