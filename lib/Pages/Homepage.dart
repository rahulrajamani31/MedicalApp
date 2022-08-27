import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> imageList = [
    "https://media.istockphoto.com/photos/modern-empty-temporary-intensive-care-emergency-room-is-ready-to-picture-id1295301481?b=1&k=20&m=1295301481&s=170667a&w=0&h=2W-5mbvRju-L4DE-fzGlhHRWhX5fS72MjUcVwj0_jvg=",
    "https://img.etimg.com/thumb/width-1200,height-900,imgsize-87147,resizemode-1,msid-65545784/industry/healthcare/biotech/healthcare/not-all-is-well-with-indias-corporate-hospital-chains.jpg",
    "https://www.narayanahealth.org/sites/default/files/Beental-Jaipur-Banner_1.jpg",
    "https://www.charakhospital.org/img/about/about1.png",
    "https://www.parkhospital.in/public/frontend/img2/Front_Image_Counter15.jpg",
    "https://www.cdc.gov/nchs/images/covid19/nhcs/encounters.jpg?_=36402"
  ];

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   backgroundColor: Colors.white,
        //   body:
        SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
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
              Container(
                margin: EdgeInsets.all(15),
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    reverse: false,
                    aspectRatio: 5.0,
                  ),
                  itemBuilder: (context, i, id) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            imageList[i],
                            width: 600,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () {
                        var url = imageList[i];
                        print(url.toString());
                      },
                    );
                  },
                ),
              ),
              Lottie.network(
                  'https://assets7.lottiefiles.com/packages/lf20_ecvwbhww.json'),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
