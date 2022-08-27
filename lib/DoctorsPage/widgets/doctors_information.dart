import 'package:flutter/material.dart';
import 'package:medicalpat/DoctorsPage/doclistmodel.dart';
import 'package:medicalpat/DoctorsPage/doctor_information_data.dart';
import 'package:medicalpat/DoctorsPage/doctor_screen.dart';
import 'package:medicalpat/constants/constants.dart';

class DoctorInformation extends StatelessWidget {
  final List<Data> doctorInformations;
  const DoctorInformation({Key? key, required this.doctorInformations})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: doctorInformations.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          // Navigator.of(context).push(
          //   PageRouteBuilder(
          //     pageBuilder: (_, __, ___) => DoctorScreen(
          //         doctorInformationModel: doctorInformations[index]),
          //     transitionsBuilder:
          //         (context, animation, secondaryAnimation, child) =>
          //             FadeTransition(opacity: animation, child: child),
          //   ),
          // );
        },
        child: Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(bottom: 15.h),
          child: SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(doctorInformations[index].img),
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  doctorInformations[index].name,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Row(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                        children: [
                                          TextSpan(
                                              text: doctorInformations[index]
                                                  .role),
                                          const TextSpan(text: '  •  '),
                                          TextSpan(text: "KMCH"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: List.generate(
                            //     5,
                            //     (index) => Row(
                            //       children: const [
                            //         Icon(
                            //           Icons.star_rounded,
                            //           color: AppColors.yellow,
                            //           size: 20,
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        Container(
                          height: 25.h,
                          width: 56.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: AppColors.boxGreen,
                          ),
                          child: Center(
                            child: Text(
                              AppText.open,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: AppColors.green,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
