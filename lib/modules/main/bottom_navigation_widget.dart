import 'package:flutter/material.dart';

import 'package:flutter_havenoneapp/modules/video/video_screen.dart';
import 'package:flutter_havenoneapp/modules/discovery/discovery_screen.dart';
import 'package:flutter_havenoneapp/modules/friend/friend_screen.dart';
import 'package:flutter_havenoneapp/modules/my/my_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_havenoneapp/common/constant.dart';
import 'package:flutter_havenoneapp/modules/account/account_screen.dart';

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
      icon:  new Image.asset(
        'images/discovery_normal.png',
        width: 30,
        height: 30,
      ),
      title: new Text('发现')
    ),
    BottomNavigationBarItem(
      icon:  new Image.asset(
        'images/video_normal.png',
        width: 30,
        height: 30,
      ),
      title: new Text('视频')
    ),
    BottomNavigationBarItem(
      icon:  new Image.asset(
        'images/music_normal.png',
        width: 30,
        height: 30,
      ),
      title: new Text('我的')
    ),
    BottomNavigationBarItem(
      icon:  new Image.asset(
        'images/friend_normal.png',
        width: 30,
        height: 30,
      ),
      title: new Text('朋友'),
    ),
    BottomNavigationBarItem(
      icon:  new Image.asset(
        'images/account_normal.png',
        width: 30,
        height: 30,
      ),
      title: new Text('账号'),
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
      ..add(My_screen())
      ..add(Account_screen());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // 适配
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
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
        selectedItemColor: Constant.themeColor,
        unselectedItemColor: Colors.black38,
        currentIndex: _currentIndex,
        onTap: _selectItem,
        items: _items,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}