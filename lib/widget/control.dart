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

  int modeInt = 0, fogInt = 0, fanInt = 0, waterInt = 0, lightInt = 0;

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
      modeInt = iotModel.mode;
      fogInt = iotModel.fog;
      fanInt = iotModel.fan;
      waterInt = iotModel.water;
      lightInt = iotModel.light;
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
                    if (value) {
                      modeInt = 1;
                      changeModeBool(value);
                    } else {
                      modeInt = 0;
                      changeModeBool(value);
                    }
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
                     changeFogBool(value);
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
                     if (value) {
                      fanInt = 1;
                      changeFanBool(value);
                    } else {
                      fanInt = 0;
                      changeFanBool(value);
                    }
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
                     if (value) {
                      waterInt = 1;
                      changeWaterBool(value);
                    } else {
                      waterInt = 0;
                      changeWaterBool(value);
                    }
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
                     if (value) {
                      lightInt = 1;
                      changeLightBool(value);
                    } else {
                      lightInt = 0;
                      changeLightBool(value);
                    }
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

  Future<void> editDatabase()async{

    print('Mode = $modeInt, Fog = $fanInt, Fan = $fanInt, Water = $waterInt, Light = $lightInt');

    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('IoT');

    Map<dynamic, dynamic> map = Map();
    map['Suitable_Tem'] = iotModel.suitableTem;
    map['Water'] = waterInt;
    map['Suitable_Humi'] = iotModel.suitableHumi;
    map['Light'] = lightInt;
    map['Fog'] = fogInt;
    map['Temp_High'] = iotModel.tempHigh;
    map['Humidity_High'] = iotModel.humidityHigh;
    map['Fan'] = fanInt;
    map['Mode'] = modeInt;
    map['Humidity_Low'] = iotModel.humidityLow;
    map['Temp_Low'] = iotModel.tempLow;

    await databaseReference.set(map).then((response){
      print('Edit Success');
    });

  }

  void changeModeBool(bool value) {
    setState(() {
      modeBool = value;
      editDatabase();
    });
  }

  void changeFogBool(bool value) {
    setState(() {
      fogBool = value;
      if (fogBool) {
        fogInt = 1;
      } else {
        fogInt = 0;
      }
      editDatabase();
    });
  }

  void changeFanBool(bool value) {
    setState(() {
      fanBool = value;
      editDatabase();
    });
  }

  void changeWaterBool(bool value) {
    setState(() {
      waterBool = value;
      editDatabase();
    });
  }

  void changeLightBool(bool value) {
    setState(() {
      lightBool = value;
      editDatabase();
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
