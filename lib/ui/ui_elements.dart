import 'package:apartment_utility/models/text_editing_controllers.dart';
import 'package:apartment_utility/models/utlility_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UIElements {
  double height = 8;

  Widget buildUtilityPlaceHolders(
    String name,
    String imagePath,
    UtilityControllers controller,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 4, right: 4),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.0),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        imagePath,
                        color: Colors.blue,
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        name,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: TextField(
                    controller: controller.cost,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Cost",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 1,
                  child: TextField(
                    controller: controller.pMeterReading,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Past meter reading",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: TextField(
                    controller: controller.meterReading,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Meter reading",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget buildRentPlaceHolder(ApartmentControllers controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.0),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(children: [
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.house_outlined,
                      color: Colors.blue,
                      size: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Apartment",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                )),
            Expanded(flex: 1, child: Text("")),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: TextField(
                    controller: controller.rent,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Rent price",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: TextField(
                    controller: controller.others,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Others",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildUtilityInfo(String name, UtilityItems item, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.0),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SvgPicture.asset(
            imagePath,
            width: 55,
            height: 55,
            color: Colors.blue,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: height,
                ),
                Text(
                  "Past meter r.: ${item.pastMeterReading}",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  height: height,
                ),
                Text(
                  "Spent: ${item.spent}",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Price: ${item.cost}",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  Text(
                    "Meter r.: ${item.meterReading}",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  Text(
                    "It costs: ${item.spentCost}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildApartmentCostInfo(
    UtilityAllItems items,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.0),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            Icons.house_outlined,
            color: Colors.blue,
            size: 55,
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Utilities cost: ${items.utilitiesCost}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height,
              ),
              Text(
                "Apartment rent: ${items.rentCost}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height,
              ),
              Text(
                "Others: ${items.others}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height,
              ),
              Text(
                "Total cost: ${items.totalCost}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
