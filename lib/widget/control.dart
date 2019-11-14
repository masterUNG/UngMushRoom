import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ungmushroom/models/iot_model.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  // Field
  bool modeBool = false,
      fogBool = false,
      fanBool = false,
      waterBool = false,
      lightBool = false;

  IotModel iotModel;

  // Method
  @override
  void initState() {
    super.initState();
    readDatabase();
  }

  Future<void> readDatabase() async {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference =
        firebaseDatabase.reference().child('IoT');
    await databaseReference.once().then((DataSnapshot dataSnapshot) {
      print('dataSnapshot = ${dataSnapshot.value}');
      iotModel = IotModel.formMap(dataSnapshot.value);
      // print('mode = ${iotModel.mode}');
      checkSwitch();
    });
  }

  void checkSwitch() {
    setState(() {
      if (iotModel.mode == 0) {
      modeBool = false;
    } else {
      modeBool = true;
    }

    if (iotModel.fog == 0) {
      fogBool = false;
    } else {
      fogBool = true;
    }

    if (iotModel.fan == 0) {
      fanBool = false;
    } else {
      fanBool = true;
    }

    if (iotModel.water == 0) {
      waterBool = false;
    } else {
      waterBool = true;
    }

    if (iotModel.light == 0) {
      lightBool = false;
    } else {
      lightBool = true;
    }
    });

    print(
        'Mode = $modeBool, Fog = $fogBool, Fan = $fanBool, Water = $waterBool, light = $lightBool');
  }

  Widget switchMode() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Mode'),
            Row(
              children: <Widget>[
                Text('Auto'),
                Switch(
                  value: modeBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('Manual')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget switchFog() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Fog'),
            Row(
              children: <Widget>[
                Text('off'),
                Switch(
                  value: fogBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('on')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget switchFan() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Fan'),
            Row(
              children: <Widget>[
                Text('off'),
                Switch(
                  value: fanBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('on')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget switchWater() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Water'),
            Row(
              children: <Widget>[
                Text('off'),
                Switch(
                  value: waterBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('on')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget switchLight() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Light'),
            Row(
              children: <Widget>[
                Text('off'),
                Switch(
                  value: lightBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('on')
              ],
            ),
          ],
        ),
      ),
    );
  }

  void changeBool(bool value) {
    setState(() {
      modeBool = value;
      print('modeBool = $modeBool');
    });
  }

  Widget modeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[switchMode()],
    );
  }

  Widget topRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        switchFog(),
        switchFan(),
      ],
    );
  }

  Widget bottonRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        switchWater(),
        switchLight(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.white, Colors.brown.shade800],
          radius: 1.0,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            modeRow(),
            topRow(),
            bottonRow(),
          ],
        ),
      ),
    );
  }
}
