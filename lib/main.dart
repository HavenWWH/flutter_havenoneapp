import 'package:flutter/material.dart';
import 'modules/main/bottom_navigation_widget.dart';
import 'package:flutter_havenoneapp/test/testScreenPage.dart';
import 'package:flutter_havenoneapp/modules/video/video_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  ThemeData theme = ThemeData(
    primarySwatch: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      静态路由参数处理
//      onGenerateRoute: (RouteSettings settings) {
//        WidgetBuilder builder;
//        if (settings.name == '/') {
//          builder = (BuildContext context) => BusinessPage();
//        } else {
//          String preS  =  settings.name.substring(0,2);
//          if (preS == '/a') { // Test_screen界面
//            String param = settings.name.split('/')[2];
//            builder = (BuildContext context) => Test_screen(index: int.parse(param));
//          } else { // 其他界面
//
//          }
//        }
//        return new MaterialPageRoute(builder: builder, settings: settings);
//      },
//      静态路由配置
//      initialRoute: '/',
//      routes: {
//        '/' : (BuildContext context) => BottomNavigationWidget(),
//        '/a': (BuildContext context) => Test_screen(),
//        '/b': (BuildContext context) => BusinessPage(),
//      },
      title: 'Flutter HavenOneApp',
      theme: theme,
      home: BottomNavigationWidget(),
    );
  }
}
