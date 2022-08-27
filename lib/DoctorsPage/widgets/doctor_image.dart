import 'package:flutter/material.dart';
import 'package:medicalpat/DoctorsPage/doclistmodel.dart';
import 'package:medicalpat/DoctorsPage/doctor_information_data.dart';
import 'package:medicalpat/DoctorsPage/widgets/widgets.dart';
import 'package:medicalpat/Network/networkapi.dart';
import 'package:medicalpat/constants/constants.dart';

class DoctorImage extends StatefulWidget {
  final Data doctorInformationModel;

  const DoctorImage({
    Key? key,
    required this.doctorInformationModel,
  }) : super(key: key);

  @override
  State<DoctorImage> createState() => _DoctorImageState();
}

class _DoctorImageState extends State<DoctorImage> {
  NetworkHandler networkHandler = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375.h,
      child: Stack(
        children: [
          Hero(
            tag: "doctor-hero-${widget.doctorInformationModel.email}",
            child: Container(
              height: 350,
              width: double.infinity,
              child: widget.doctorInformationModel.img == "null"
                  ? FittedBox(
                      fit: BoxFit.fill,
                      child: Image(
                          image:
                              AssetImage("assets/images/defaultprofile.jpg")))
                  : FittedBox(
                      fit: BoxFit.fill,
                      child: Image(
                          image: NetworkImage(NetworkHandler()
                              .getImage(widget.doctorInformationModel.email))),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CustomAppBar(
              backButton: true,
              profile: false,
              icon: Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
