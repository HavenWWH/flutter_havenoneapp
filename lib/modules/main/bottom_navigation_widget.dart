import 'package:flutter/material.dart';

import 'package:flutter_havenoneapp/modules/business/business_screen.dart';
import 'package:flutter_havenoneapp/modules/home/home_screen.dart';
import 'package:flutter_havenoneapp/modules/school/school_screen.dart';
import 'package:flutter_havenoneapp/modules/my/my_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    // 适配
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸)
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}');
    print('设备高度:${ScreenUtil.screenHeight}');
    print('设备的像素密度:${ScreenUtil.pixelRatio}');
    print('底部安全区距离:${ScreenUtil.bottomBarHeight}');
    print('状态栏高度:${ScreenUtil.statusBarHeight}px');
    print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
    print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');
    print('宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    print('高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');
    print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');

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