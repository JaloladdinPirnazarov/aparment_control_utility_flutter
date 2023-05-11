import 'package:apartment_utility/database/pref_manager.dart';
import 'package:apartment_utility/models/text_editing_controllers.dart';
import 'package:apartment_utility/models/utlility_items.dart';
import 'package:apartment_utility/pages/result.dart';
import 'package:apartment_utility/ui/ui_elements.dart';
import 'package:apartment_utility/others/actions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late PrefManager pref;
  UIElements elements = UIElements();
  Actions_ actions = Actions_();
  UtilityControllers gasController = UtilityControllers();
  UtilityControllers waterController = UtilityControllers();
  UtilityControllers electricityController = UtilityControllers();
  ApartmentControllers apartmentController = ApartmentControllers();

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((preferences) {
      pref = PrefManager(preferences);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: [
            elements.buildUtilityPlaceHolders("Gas", 'assets/fire.svg', gasController),
            elements.buildUtilityPlaceHolders("Water", 'assets/water_drop.svg', waterController),
            elements.buildUtilityPlaceHolders("Electricity", 'assets/bulb.svg', electricityController),
            elements.buildRentPlaceHolder(apartmentController),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                child: Text("CALCULATE"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: ()=> goToResult(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void goToResult(){
    UtilityAllItems allItems = actions.calculateAll(gasController, waterController, electricityController, apartmentController);
    if(allItems.calculated){
      Route route = MaterialPageRoute(builder: (BuildContext context) => Result(allItems));
      Navigator.push(context, route);
    }else{
      String title = "Error";
      String message = "Fill at least one utility in all fields";
      Icon icon = Icon(Icons.error_outline, color: Colors.red,);
      actions.showCustomDialog(context, icon, title, message);
    }
  }
}
