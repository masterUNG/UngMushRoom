class IotModel {
  // Field
  int suitableTem,
      water,
      suitableHumi,
      light,
      fog,
      tempHigh,
      humidityHigh,
      fan,
      mode,
      humidityLow,
      tempLow;

  // Constructor
  IotModel(
      this.suitableTem,
      this.water,
      this.suitableHumi,
      this.light,
      this.fog,
      this.tempHigh,
      this.fan,
      this.humidityLow,
      this.tempLow,
      this.humidityHigh,
      this.mode);

  IotModel.formMap(Map<dynamic, dynamic> map) {
    suitableTem = map['Suitable_Tem'];
    water = map['Water'];
    suitableHumi = map['Suitable_Humi'];
    light = map['Light'];
    fog = map['Fog'];
    tempHigh = map['Temp_High'];
    fan = map['Fan'];
    humidityLow = map['Humidity_Low'];
    tempLow = map['Temp_Low'];
    humidityHigh = map['Humidity_High'];
    mode = map['Mode'];
  }

  Map<dynamic, dynamic> toMap(){
    final Map<dynamic, dynamic> map = Map<dynamic, dynamic>();
    map['Suitable_Tem'] = suitableTem;
    map['Water'] = water;
    map['Suitable_Humi'] = suitableHumi;
    map['Light'] = light;
    map['Fog'] = fog;
    map['Temp_High'] = tempHigh;
    map['Fan'] = fan;
    map['Humidity_Low'] = humidityLow;
    map['Temp_Low'] = tempLow;
    map['Humidity_High'] = humidityHigh;
    map['Mode'] = mode;

    return map;

  }


}
