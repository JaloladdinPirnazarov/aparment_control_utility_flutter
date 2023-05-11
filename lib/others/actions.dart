import 'package:apartment_utility/models/text_editing_controllers.dart';
import 'package:apartment_utility/models/utlility_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Actions_ {
  UtilityItems calculateItem(UtilityControllers controller) {
    UtilityItems items = UtilityItems();
    if (controller.cost.text.isNotEmpty &&
        controller.meterReading.text.isNotEmpty &&
        controller.pMeterReading.text.isNotEmpty) {
      items.cost = int.parse(controller.cost.text);
      items.meterReading = int.parse(controller.meterReading.text);
      items.pastMeterReading = int.parse(controller.pMeterReading.text);
      items.calculated = true;
      items.spent = items.meterReading - items.pastMeterReading;
      items.spentCost = items.spent * items.cost;
    }
    return items;
  }

  UtilityAllItems calculateAll(UtilityControllers gas, UtilityControllers water,
      UtilityControllers electricity, ApartmentControllers apartment) {
    UtilityAllItems allItems = UtilityAllItems();

    allItems.gas = calculateItem(gas);
    allItems.water = calculateItem(water);
    allItems.electricity = calculateItem(electricity);

    if(allItems.gas.calculated){
      allItems.utilitiesCost += allItems.gas.spentCost;
      allItems.totalCost += allItems.gas.spentCost;
      allItems.calculated = true;
    }

    if(allItems.water.calculated){
      allItems.utilitiesCost += allItems.water.spentCost;
      allItems.totalCost += allItems.water.spentCost;
      allItems.calculated = true;
    }

    if(allItems.electricity.calculated){
      allItems.utilitiesCost += allItems.electricity.spentCost;
      allItems.totalCost += allItems.electricity.spentCost;
      allItems.calculated = true;
    }

    if(apartment.rent.text.isNotEmpty){
      allItems.rentCost = int.parse(apartment.rent.text);
      allItems.totalCost += allItems.rentCost;
    }

    if(apartment.others.text.isNotEmpty){
      allItems.others = int.parse(apartment.others.text);
      allItems.totalCost += allItems.others;
    }
    return allItems;
  }

  String numberFormatter(int number){
    String numberS = number.toString();
    String formattedNumber = "";
    int counter = 0;
    if(numberS.length > 3){
      for(int i = numberS.length - 1; i > -1 ; i--){
        counter ++;
        if(counter % 3 == 0){
          formattedNumber = " ${numberS[i]}$formattedNumber";
        }else{
          formattedNumber = "${numberS[i]}$formattedNumber";
        }
      }
      return formattedNumber;
    }
    else return numberS;
  }


  void showCustomDialog(BuildContext context,Icon icon, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              icon,
              SizedBox(width: 8),
              Text(title),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
