import 'package:flutter/material.dart';
import 'package:plantapp/pages/plantdetails.dart';

import '../model/plantmodel.dart';
import '../style/textstyle.dart';

class PlantItem extends StatelessWidget {
  final Plants plant;
  final bool isEven;
  const PlantItem({super.key, required this.plant, required this.isEven});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (__) {
          return PlantDetails(plantItem:plant);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 1)),
          ],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                plant.images,
                height: 150,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Text(
                plant.name,
                style: appstyle(
                    color: Colors.black, size: 14, ff: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${plant.price}",
                  style: appstyle(
                      color: Colors.black, size: 16, ff: FontWeight.bold),
                ),
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
