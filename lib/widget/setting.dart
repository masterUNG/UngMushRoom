import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ungmushroom/models/iot_model.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Field
  IotModel iotModel;
  String humHight = '',
      humLow = '',
      suiTemp = '',
      suiHum = '',
      temLow = '',
      temHight = '';

  final formKey = GlobalKey<FormState>();

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
      setState(() {
        iotModel = IotModel.formMap(dataSnapshot.value);
        humLow = iotModel.humidityLow.toString();
        humHight = iotModel.humidityHigh.toString();
        suiTemp = iotModel.suitableTem.toString();
        suiHum = iotModel.suitableHumi.toString();
        temLow = iotModel.tempLow.toString();
        temHight = iotModel.tempHigh.toString();
      });
    });
  }

  Widget humidityHight() {
    print('humLow = $humLow');
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: humLow,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'current: $humHight',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Humidity Hight',
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            humHight = value.trim();
          }
        },
      ),
    );
  }

  Widget humidityLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: humLow,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'current: $humLow',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Humidity Low',
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            humLow = value.trim();
          }
        },
      ),
    );
  }

  Widget suitableHumi() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: suiHum,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'current: $suiHum',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Humi',
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            suiHum = value.trim();
          }
        },
      ),
    );
  }

  Widget suitableTemp() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: suiTemp,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'current: $suiTemp',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Temp',
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            suiTemp = value.trim();
          }
        },
      ),
    );
  }

  Widget tempHight() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: temHight,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'current: $temHight',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Temp Hight',
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            temHight = value.trim();
          }
        },
      ),
    );
  }

  Widget tempLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: temLow,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'current: $temLow',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Temp Low',
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            temLow = value.trim();
          }
        },
      ),
    );
  }

  Widget rowTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        humidityLow(),
        SizedBox(
          width: 4.0,
        ),
        humidityHight(),
      ],
    );
  }

  Widget rowMedile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        suitableTemp(),
        SizedBox(
          width: 4.0,
        ),
        suitableHumi(),
      ],
    );
  }

  Widget rowBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        tempLow(),
        SizedBox(
          width: 4.0,
        ),
        tempHight(),
      ],
    );
  }

  Widget uploadValue() {
    return RaisedButton.icon(
      icon: Icon(Icons.cloud_upload),
      label: Text('Upload Value'),
      onPressed: () {
        formKey.currentState.save();
        editDatabase();
      },
    );
  }

  Future<void> editDatabase() async {
    print(
        'humLow = $humLow, humHight = $humHight, suitTemp = $suiTemp, suitHumi = $suiHum, tempLow = $temLow, tempHight = $temHight');

    // int test = int.parse(source)

    IotModel myIotModel = IotModel(
        int.parse(suiTemp),
        iotModel.water,
        int.parse(suiHum),
        iotModel.light,
        iotModel.fog,
        int.parse(temHight),
        iotModel.fan,
        int.parse(humLow),
        int.parse(temLow),
        int.parse(humHight),
        iotModel.mode);

    Map map = myIotModel.toMap();
    print('map = $map');

    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('IoT');
    await databaseReference.set(map).then((response){
      readDatabase();
    });


    


  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 40.0,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              rowTop(),
              SizedBox(
                height: 16.0,
              ),
              rowMedile(),
              SizedBox(
                height: 16.0,
              ),
              rowBottom(),
              uploadValue(),
            ],
          ),
        ),
      ),
    );
  }
}
