import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalpat/DoctorsPage/FrontDocs.dart';
import 'package:medicalpat/constants/constants.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  List<MedicalServicesModel> medicalService = [
    MedicalServicesModel(
      color: AppColors.blue,
      title: AppText.consultation,
      image: AppImages.stethoscope,
    ),
    MedicalServicesModel(
      color: AppColors.purple,
      title: AppText.dental,
      image: AppImages.teeth,
    ),
    MedicalServicesModel(
      color: AppColors.red,
      title: AppText.heart,
      image: AppImages.heart,
    ),
    MedicalServicesModel(
      color: AppColors.orange,
      title: AppText.hospitals,
      image: AppImages.clinic,
    ),
    MedicalServicesModel(
      color: AppColors.green,
      title: AppText.medicines,
      image: AppImages.medicine,
    ),
    MedicalServicesModel(
      color: AppColors.cyan,
      title: AppText.physician,
      image: AppImages.care,
    ),
    MedicalServicesModel(
      color: AppColors.pink,
      title: AppText.skin,
      image: AppImages.bandage,
    ),
    MedicalServicesModel(
      color: AppColors.dullOrange,
      title: AppText.surgeon,
      image: AppImages.syringe,
    ),
  ];

  int selectedService = 4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        // child:
        // SingleChildScrollView(
        //   physics: const BouncingScrollPhysics(),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
            Text(
              " Med Line",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notification_add_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Services ",
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: medicalService.length,
                  itemBuilder: (BuildContext context, int index) {
                    return serviceContainer(
                        medicalService[index].image,
                        medicalService[index].title,
                        index,
                        medicalService[index].color);
                  }),
            ),
            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(10),
            //           topRight: Radius.circular(10),
            //         )),
            //     child: Column(
            //       children: [
            //         SizedBox(
            //           height: 10,
            //         ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                child:
                    Text('Easy, reliable way \n to take care  of your health',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
              ),
            ),
            //         SizedBox(
            //           height: 0,
            //         ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Text(
                    'Make your appoinments simple and easy!! \n \t\t\t\t We here with the best doctors!!',
                    style: GoogleFonts.sacramento(
                      textStyle: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 23,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                elevation: 15,
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Doctors(),
                    ),
                  );
                },
                height: 45,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    'Get Doctors',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // ),
        // )
      ],
    )
        // ],
        // ),
        //   ),
        // ),
        // ),
        );
  }

  serviceContainer(String image, String name, int index, Color color) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue.shade100
                : Colors.grey.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(image, height: 30),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 14),
              )
            ]),
      ),
    );
  }
}

class MedicalServicesModel {
  final Color color;
  final String title;
  final String image;

  MedicalServicesModel({
    required this.color,
    required this.title,
    required this.image,
  });
}
