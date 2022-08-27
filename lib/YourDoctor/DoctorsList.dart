import 'dart:async';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:medicalpat/YourDoctor/Doctorsreport.dart';

class Doctorlist extends StatefulWidget {
  const Doctorlist({Key? key}) : super(key: key);

  @override
  _DoctorlistState createState() => _DoctorlistState();
}

class _DoctorlistState extends State<Doctorlist> {
  var selectindex = -1;
  List datas = [
    {
      "title": "SriRam",
      "spec": "General Doctor",
      "Specialist": "No",
      "LastVis": "02/09/2022",
      "descrption": "To check your normal health",
      "imgurl": "assets/images/doctor1.png"
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
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                Text(
                  'Your Doctors',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 650,
              width: double.infinity,
              child: ListView.builder(
                itemCount: datas.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      showDialogfun(
                          context,
                          datas[index]["imgurl"],
                          datas[index]["title"],
                          datas[index]["descrption"],
                          datas[index]["spec"],
                          datas[index]["LastVis"]);
                    },
                    child: GlassmorphicContainer(
                      width: double.infinity,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      borderRadius: 20,
                      blur: 200,
                      alignment: Alignment.bottomCenter,
                      border: 2,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.1),
                            Color(0xFFFFFFFF).withOpacity(0.05),
                          ],
                          stops: [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.1),
                          Color((0xFFFFFFFF)).withOpacity(0.9),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          // color: Colors.grey
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(datas[index]["imgurl"]),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: Icon(Icons.arrow_forward)),
                          title: Text(
                            datas[index]["title"],
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          isThreeLine: true,
                          subtitle: Column(
                            children: [
                              Text(
                                datas[index]["spec"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(datas[index]["descrption"]),

                                  // Text(datas[index][]),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  showDialogfun(context, img, title, descrption, spec, Lastvis) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 380,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          img,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Descrption : ${descrption}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Last Visited: ${Lastvis}"),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorReport(
                                        Doctor: title,
                                        url: img,
                                        spec: spec,
                                        Lastvis: Lastvis,
                                      )),
                            );
                          },
                          child: Text("View Report"))
                    ]),
              ),
            ),
          );
        });
  }

  Size get preferredSize => throw UnimplementedError();
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
