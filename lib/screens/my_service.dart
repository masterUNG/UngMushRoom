import 'package:flutter/material.dart';
import 'package:ungmushroom/utility/my_style.dart';
import 'package:ungmushroom/widget/control.dart';
import 'package:ungmushroom/widget/monitor.dart';
import 'package:ungmushroom/widget/setting.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Field
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Drawer();
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
          bottom: TabBar(indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            tabs: <Widget>[
              tabsMonitor(),
              tabsControl(),
              tabsSetting(),
            ],
          ),
        ),body: TabBarView(children: <Widget>[Monitor(), Control(), Setting(),],),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: showTabController(),
      drawer: showDrawer(),
    );
  }
}
