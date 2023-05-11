import 'package:apartment_utility/models/utlility_items.dart';
import 'package:apartment_utility/ui/ui_elements.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final UtilityAllItems allItems;

  Result(this.allItems);

  @override
  State<Result> createState() => _ResultState(allItems);
}

class _ResultState extends State<Result> {
  final UtilityAllItems allItems;

  _ResultState(this.allItems);

  UIElements elements = UIElements();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: [
            allItems.gas.calculated
                ? elements.buildUtilityInfo(
                    "Gas", allItems.gas, "assets/fire.svg")
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
            allItems.water.calculated
                ? elements.buildUtilityInfo(
                    "Water", allItems.water, "assets/water_drop.svg")
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
            allItems.electricity.calculated
                ? elements.buildUtilityInfo(
                    "Electricity", allItems.electricity, "assets/bulb.svg")
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
            elements.buildApartmentCostInfo(allItems),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                Text("Save function will be added \nin the next version", style: TextStyle(fontSize: 20, color: Colors.black,),),
                SizedBox(width: 10,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
