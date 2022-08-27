import 'package:flutter/material.dart';
import 'package:medicalpat/DoctorsPage/C&A/appoinments.dart';
import 'package:medicalpat/DoctorsPage/C&A/chats.dart';
import 'package:medicalpat/DoctorsPage/doclistmodel.dart';
import 'package:medicalpat/DoctorsPage/doctor_information_data.dart';
import 'package:medicalpat/DoctorsPage/widgets/doctor_details.dart';
import '../../constants/constants.dart';

class DoctorDescription extends StatelessWidget {
  const DoctorDescription({
    Key? key,
    required this.doctorInformationModel,
  }) : super(key: key);

  final Data doctorInformationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctorInformationModel.name,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  style: Theme.of(context).textTheme.headline5,
                  children: [
                    TextSpan(text: doctorInformationModel.role),
                    const TextSpan(text: '  •  '),
                    TextSpan(text: "KMCH"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
              '${doctorInformationModel.name} is one of the best doctors in the ${"KMCH"}. He has saved more than 1000 patients in the past 3 years. He has also received many awards from domestic and abroad as the best doctors. He is available on a private or schedule. '),
          SizedBox(height: 20.h),
          const DoctorDetails(),
          SizedBox(height: 20.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Chats()));
                },
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.blue,
                  ),
                  child: Image.asset(
                    AppImages.comments,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(width: 20.h),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Appoinments()));
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.green,
                    ),
                    child: Center(
                      child: Text(
                        AppText.makeAppointment,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
