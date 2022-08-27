import 'package:medicalpat/constants/images.dart';
import 'package:medicalpat/constants/text.dart';

class DoctorInformationModel {
  final String email;
  final String image;
  final String title;
  final String specialist;
  final String hospital;
  // final String star;

  DoctorInformationModel({
    required this.email,
    required this.image,
    required this.title,
    required this.specialist,
    required this.hospital,
    // required this.star,
  });
}

List<DoctorInformationModel> doctorInformation = [
  DoctorInformationModel(
    email: '1',
    image: AppImages.doctor1,
    title: AppText.doctor1,
    specialist: AppText.heart,
    hospital: AppText.hospital1,
    // star: '50',
  ),
  DoctorInformationModel(
    email: '2',
    image: AppImages.doctor2,
    title: AppText.doctor2,
    specialist: AppText.eye,
    hospital: AppText.hospital1,
    // star: '60',
  ),
  DoctorInformationModel(
    email: '3',
    image: AppImages.doctor3,
    title: AppText.doctor3,
    specialist: AppText.ears,
    hospital: AppText.hospital1,
    // star: '80',
  ),
  DoctorInformationModel(
    email: '4',
    image: AppImages.doctor4,
    title: AppText.doctor4,
    specialist: AppText.skin,
    hospital: AppText.hospital1,
    // star: '20',
  ),
];
