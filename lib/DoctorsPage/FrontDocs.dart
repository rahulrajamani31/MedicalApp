import 'package:flutter/material.dart';
import 'package:medicalpat/DoctorsPage/doclistmodel.dart';
import 'package:medicalpat/DoctorsPage/doctor_information_data.dart';
import 'package:medicalpat/DoctorsPage/doctor_screen.dart';
import 'package:medicalpat/DoctorsPage/widgets/doctors_information.dart';
import 'package:medicalpat/DoctorsPage/widgets/textbox.dart';
import 'package:medicalpat/constants/constants.dart';

import '../Network/networkapi.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  late List<Data> data;
  List<DoctorInformationModel> newdoctorInformations = [];
  NetworkHandler networkHandler = NetworkHandler();

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  void getUserData() async {
    var response = await networkHandler.get("duser/getdoctors");
    List<Data> datar =
        List.from(response['data']).map((e) => Data.fromJson(e)).toList();
    setState(() {
      data = datar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                    Text(
                      AppText.findDoctor,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Container(
                      width: 40,
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                const CustomTextBox(),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      AppText.topDoctors,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      AppText.viewAll,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: AppColors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              DoctorScreen(doctorInformationModel: data[index]),
                          transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                        ),
                      );
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
                                child: data[index].img == "null"
                                    ? CircleAvatar(
                                        radius: 60.0,
                                        backgroundImage: AssetImage(
                                            "assets/images/defaultprofile.jpg"))
                                    : CircleAvatar(
                                        radius: 60.0,
                                        backgroundImage: NetworkImage(
                                            NetworkHandler()
                                                .getImage(data[index].email)))),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30.h,
                                            ),
                                            Text(
                                              data[index].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
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
                                                          text:
                                                              data[index].role),
                                                      const TextSpan(
                                                          text: '  •  '),
                                                      TextSpan(text: "KMCH"),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 25.h,
                                      width: 56.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
