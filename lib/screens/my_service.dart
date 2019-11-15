import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungmushroom/screens/home.dart';
import 'package:ungmushroom/utility/my_style.dart';
import 'package:ungmushroom/widget/add_display_name.dart';
import 'package:ungmushroom/widget/control.dart';
import 'package:ungmushroom/widget/home_service.dart';
import 'package:ungmushroom/widget/monitor.dart';
import 'package:ungmushroom/widget/page2.dart';
import 'package:ungmushroom/widget/page3.dart';
import 'package:ungmushroom/widget/setting.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Field
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String login = '...';
  Widget currentWidget = HomeService();

  // Method
  Widget hambargerButton() {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        scaffoldKey.currentState.openDrawer();
      },
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHead(),
          menuHome(),
          menuAddDisplayName(),
          menuPage2(),
          menuPage3(),
          menuSignOut(),
        ],
      ),
    );
  }

  void test() {}

  Widget showHead() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/wall.jpg'), fit: BoxFit.cover),
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung MushRoom',
      style: TextStyle(color: Colors.white),
    );
  }

  Widget showLogin() {
    return Text(
      'Login by $login',
      style: TextStyle(color: Colors.white),
    );
  }

  Widget menuAddDisplayName() {
    return ListTile(
      leading: Icon(Icons.filter_1),
      title: Text('Add Display Name'),
      subtitle: Text('Add of Change Display Name'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = AddDisplayName();
        });
      },
    );
  }

  Widget menuPage2() {
    return ListTile(
      leading: Icon(Icons.filter_2),
      title: Text('Page 2'),
      subtitle: Text('Description page 2'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = Page2();
        });
      },
    );
  }

  Widget menuPage3() {
    return ListTile(
      leading: Icon(Icons.filter_3),
      title: Text('Page 3'),
      subtitle: Text('Description page 3'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = Page3();
        });
      },
    );
  }

  Widget menuSignOut() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Log Out'),
      subtitle: Text('Log Out and Back Authen'),
      onTap: () {
        Navigator.of(context).pop();
        processLogOut();
      },
    );
  }

  Future<void> processLogOut()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response){
      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context){return Home();});
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route){return false;});
    });
  }

  Widget menuHome() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text('Home'),
      subtitle: Text('Description Home'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = HomeService();
        });
      },
    );
  }

  Widget tabsMonitor() {
    return Tab(
      icon: Icon(Icons.airplay),
      text: 'Monitor',
    );
  }

  Widget tabsControl() {
    return Tab(
      icon: Icon(Icons.screen_lock_portrait),
      text: 'Control',
    );
  }

  Widget tabsSetting() {
    return Tab(
      icon: Icon(Icons.settings),
      text: 'Setting',
    );
  }

  Widget showTabController() {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: hambargerButton(),
          backgroundColor: MyStyle().textColor,
          title: Text('My Service'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            tabs: <Widget>[
              tabsMonitor(),
              tabsControl(),
              tabsSetting(),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Monitor(),
            Control(),
            Setting(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      key: scaffoldKey,
      body: currentWidget,
      drawer: showDrawer(),
    );
  }
}
