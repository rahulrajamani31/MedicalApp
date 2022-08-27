import 'package:flutter/material.dart';
import 'package:medicalpat/Pages/predict.dart';
import 'package:medicalpat/Service/screens/home/home.dart';
import 'package:medicalpat/YourDoctor/DoctorsList.dart';
import 'package:medicalpat/constants/constants.dart';

class Servicesmain extends StatefulWidget {
  const Servicesmain({Key? key}) : super(key: key);

  @override
  _ServicesmainState createState() => _ServicesmainState();
}

class _ServicesmainState extends State<Servicesmain> {
  List<Services> services = [
    Services('Your Doctors', 'assets/Doctorlogo.png',
        Color.fromARGB(151, 36, 165, 165)),
    Services(
      'Symptoms \n checker',
      'assets/symptoms.png',
      AppColors.purple,
    ),
    Services('Ambulance \n \tTracker', 'assets/ambul.png', AppColors.blue),
    Services('Medicine \n Reminder', 'assets/medrem01.png', AppColors.green),
    Services('Order \n Medicine', 'assets/medord.png', AppColors.pink),
  ];
  List<Widget> screens = [Doctorlist(), Predict(), Home()];
  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: selectedService >= 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screens[selectedService],
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                backgroundColor: Colors.black,
              )
            : null,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                    padding:
                        EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                        Text(
                          'Hospital Services',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    )),
              )
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: services.length,
                        itemBuilder: (BuildContext context, int index) {
                          return serviceContainer(services[index].imageURL,
                              services[index].name, index, services[index].clr);
                        }),
                  ),
                ]),
          ),
        ));
  }

  serviceContainer(String image, String name, int index, Color clr) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.blue.shade50 : clr,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(image, height: 80),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              )
            ]),
      ),
    );
  }
}

class Services {
  final String name;
  final String imageURL;
  final Color clr;

  Services(this.name, this.imageURL, this.clr);
}
