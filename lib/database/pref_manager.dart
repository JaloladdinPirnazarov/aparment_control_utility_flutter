import 'package:apartment_utility/database/constants.dart';
import 'package:apartment_utility/models/utlility_items.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PrefManager{
  SharedPreferences pref;
  PrefManager(this.pref);
  Constants constants = Constants();

  Future<Null> save(UtilityAllItems items)async{
    pref.setInt(constants.gasMeterReading, items.gas.meterReading);
    pref.setInt(constants.waterMeterReading, items.water.meterReading);
    pref.setInt(constants.electricityMeterReading, items.electricity.meterReading);

  }
}