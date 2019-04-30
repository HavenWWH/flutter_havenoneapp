import 'package:flutter/material.dart';

import 'package:flutter_havenoneapp/modules/business/business_screen.dart';
import 'package:flutter_havenoneapp/modules/home/home_screen.dart';
import 'package:flutter_havenoneapp/modules/school/school_screen.dart';
import 'package:flutter_havenoneapp/modules/my/my_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  
  BottomNavigationWidget({Key key}) : super(key: key);
  
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  int _currentIndex = 0;
  List<Widget> screenList = List();

  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: new Icon(Icons.home),
      title: new Text('Home')
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.business),
      title: new Text('business')
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.school),
      title: new Text('school')
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.person),
      title: new Text('mine'),
    ),
  ];

  void _selectItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  void initState() {
    screenList
      ..add(Home_screen())
      ..add(Business_screen())
      ..add(School_screen())
      ..add(My_screen());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: screenList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black38,
        currentIndex: _currentIndex,
        onTap: _selectItem,
        items: _items,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}