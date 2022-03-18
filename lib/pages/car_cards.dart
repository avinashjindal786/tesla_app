import 'package:flutter/material.dart';
import 'package:tesla_app/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'next_page.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tesla_app/colors/colors.dart';
import 'package:coast/coast.dart';
class BoatCard extends StatelessWidget {
  const BoatCard({

    required this.boat,
  });

  final Boat boat;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [


          Text(
            boat.text,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          DragTarget(builder: (context, carreached, carNotreached) {
            return Center(
              child: Container(
                height: 100,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: containerGrey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_rounded,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Swipe Up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }, onAccept: (data) {
            if (data == "unlock") {
              print("object");

            }
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Draggable(
            axis: Axis.vertical,
            data: "unlock",
            // onDragStarted: () {
            //   print("object");
            // },
            // onDragEnd: (value) {
            //   print(value);
            // },
            // onDragCompleted: () {
            //   print("completed");
            // },
            onDraggableCanceled: (value, d) {
              print(value);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return BoatDetails(boat: boat,);
              }));
            },
            child: Crab(
              tag: "tesla",
              child: Container(
                height: 750,
                child: SimpleShadow(
                  child: Image.asset(boat.img),
                  opacity: 1, // Default: 0.5
                  // color: shadowColor, // Default: Black
                  offset: Offset(10, 5), // Default: Offset(2, 2)
                  sigma: 7,
                ),
              ),
            ),
            feedback: Container(
              height: 750,
              child: SimpleShadow(
                child: Image.asset(boat.img),
                opacity: 1, // Default: 0.5
                // color: shadowColor, // Default: Black
                offset: Offset(10, 5), // Default: Offset(2, 2)
                sigma: 15,
              ),
            ),
            childWhenDragging: Container(),
          ),
        ],
      ),
    );
  }
}