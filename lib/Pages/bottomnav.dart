import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:medicalpat/Pages/Homepage.dart';
import 'package:medicalpat/Pages/profile.dart';
import 'package:medicalpat/Pages/service.dart';
import 'package:medicalpat/Pages/Servicescreen.dart';

class BottomNavyBarExample extends StatefulWidget {
  const BottomNavyBarExample({Key? key}) : super(key: key);

  @override
  _BottomNavyBarExampleState createState() => _BottomNavyBarExampleState();
}

class _BottomNavyBarExampleState extends State<BottomNavyBarExample> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: <Widget>[
              _buildPage(entry: Homepage()),
              _buildPage(entry: Service()),
              _buildPage(entry: Servicesmain()),
              _buildPage(entry: Profile()),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: false,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.local_hospital),
                title: Text('Doctors'),
                activeColor: Colors.blue),
            BottomNavyBarItem(
                icon: Icon(Icons.medical_services),
                title: Text('Service'),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Profile'),
                activeColor: Colors.purpleAccent),
          ],
        ));
  }

  _buildPage({
    Widget? entry,
  }) {
    return entry;
  }
}
