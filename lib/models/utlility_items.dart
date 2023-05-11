import 'package:flutter/material.dart';

class UtilityItems{
  int meterReading = 0;
  int pastMeterReading = 0;
  int cost = 0;
  int spent = 0;
  int spentCost = 0;
  bool calculated = false;
}

class UtilityAllItems{
  UtilityItems gas = UtilityItems();
  UtilityItems water = UtilityItems();
  UtilityItems electricity = UtilityItems();
  int utilitiesCost = 0;
  int rentCost = 0;
  int others = 0;
  int totalCost = 0;
  bool calculated = false;
}