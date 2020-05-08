import 'package:SkillShare/Views/data_view.dart';
import 'package:SkillShare/Views/home_view.dart';
import 'package:SkillShare/Views/profiles_view.dart';
import 'package:SkillShare/Views/settings_view.dart';
import 'package:SkillShare/locator.dart';
import 'package:SkillShare/routes.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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


  CurvedNavigationBar _bottomNavBar(Size screenSize) => CurvedNavigationBar(
    backgroundColor: Colors.white,
    onTap: (index){
      setState(() {
        _currentIndex = index;
      });
    },
    buttonBackgroundColor: Colors.blue,
    color: Colors.red,
    items: allNavs,
    animationDuration: Duration(milliseconds: 400),
  );

  List<Widget> allNavs = [
    Icon(Icons.home),
    Icon(Icons.person, ),
    Icon(Icons.wrap_text, ),
    Icon(Icons.settings, ),
  ];
}
