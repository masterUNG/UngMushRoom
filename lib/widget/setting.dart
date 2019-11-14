import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Field

  // Method
  Widget humidityHight() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Humidity Hight',
        ),
      ),
    );
  }

  Widget humidityLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Humidity Low',
        ),
      ),
    );
  }

  Widget suitableHumi() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Humi',
        ),
      ),
    );
  }

  Widget suitableTemp() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Temp',
        ),
      ),
    );
  }

  Widget tempHight() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Temp Hight',
        ),
      ),
    );
  }

  Widget tempLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Temp Low',
        ),
      ),
    );
  }

  Widget rowTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        humidityHight(),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 40.0,
      ),
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
        ],
      ),
    );
  }
}
