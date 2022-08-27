import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicalpat/Login/welcome_screen.dart';
import 'package:medicalpat/Pages/bottomnav.dart';
import 'package:medicalpat/Service/screens/add_new_medicine/add_new_medicine.dart';
import 'package:medicalpat/Service/screens/home/home.dart';
import 'package:medicalpat/constants/constants.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.05),
      statusBarColor: Colors.black.withOpacity(0.05),
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = WelcomeScreen();
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String? token = await storage.read(key: "token");
    if (token != null) {
      setState(() {
        page = BottomNavyBarExample();
      });
    } else {
      setState(() {
        page = WelcomeScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doctor App UI',
        theme: AppTheme.appTheme,
        home: page,
        routes: {
          "/home": (context) => Home(),
          "/add_new_medicine": (context) => AddNewMedicine(),
        },
      ),
    );
  }
}

// class Mainpage extends StatefulWidget {
//   const Mainpage({Key? key}) : super(key: key);

//   @override
//   State<Mainpage> createState() => _MainpageState();
// }

// class _MainpageState extends State<Mainpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   Text(
//                     "Welcome",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "Welcome to Medical Pro..We provide the best service",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.grey[700], fontSize: 15),
//                   ),
//                 ],
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height / 3,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/Front.png'), fit: BoxFit.cover),
//                 ),
//               ),
//               Column(
//                 children: <Widget>[
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => LoginPage()));
//                     },
//                     shape: RoundedRectangleBorder(
//                         side: BorderSide(color: Colors.black),
//                         borderRadius: BorderRadius.circular(50)),
//                     child: Text(
//                       "Login",
//                       style:
//                           TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(top: 3, left: 3),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border(
//                           bottom: BorderSide(color: Colors.black),
//                           top: BorderSide(color: Colors.black),
//                           left: BorderSide(color: Colors.black),
//                           right: BorderSide(color: Colors.black),
//                         )),
//                     child: MaterialButton(
//                       minWidth: double.infinity,
//                       height: 60,
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SignupPage()));
//                       },
//                       color: Colors.greenAccent,
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50)),
//                       child: Text(
//                         "Sign up",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600, fontSize: 18),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
