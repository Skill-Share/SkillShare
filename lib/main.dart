import 'package:SkillShare/Views/data_view.dart';
import 'package:SkillShare/Views/home_view.dart';
import 'package:SkillShare/Views/profiles_view.dart';
import 'package:SkillShare/Views/settings_view.dart';
import 'package:SkillShare/core/classes/bottom_nav.dart';
import 'package:SkillShare/locator.dart';
import 'package:SkillShare/routes.dart';
import 'package:flutter/material.dart';

void main() {
  setLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Router.routes,
      // initialRoute: '',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    print("state called");
    print(_currentIndex);
    return Scaffold(
      body:  SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            HomeView(),
            onSystemBackButton(ProfilesView()),
            onSystemBackButton(DataView()),
            onSystemBackButton(SettingsView()),
          ],
        ),
        
      ),
      bottomNavigationBar: _bottomNavBar(_screenSize),
    );
  }

  //this would take you back to home page 
  WillPopScope onSystemBackButton(Widget view) => WillPopScope(child: view, onWillPop: () => onNavTapped(0));

  onNavTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }


  BottomNavigationBar _bottomNavBar(Size screenSize) => BottomNavigationBar(
    elevation: 10.0,
    currentIndex: _currentIndex,
    iconSize: screenSize.height/25, 
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    onTap: (index){
      setState(() {
        _currentIndex = index;
      });
    },
    items: allNavs,
  );

  List<BottomNavigationBarItem> allNavs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(
        "Home",
        style: TextStyle( fontWeight: FontWeight.bold),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, ),
      title: Text(
        "Profiles",
        style: TextStyle(),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.wrap_text, ),
      title: Text(
        "History",
        style: TextStyle(),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings, ),
      title: Text(
        "Settings",
        style: TextStyle(),
      ),
    ),
  ];
}
