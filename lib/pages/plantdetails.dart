import 'package:flutter/material.dart';
import 'package:plantapp/model/plantmodel.dart';
import 'package:provider/provider.dart';

import '../controller/plantcontroller.dart';
import '../style/textstyle.dart';
import 'cartpage.dart';

class PlantDetails extends StatelessWidget {
  final Plants plantItem;
  const PlantDetails({super.key, required this.plantItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 240, 235, 235),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 240, 235, 235),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (__) {
                        return CartPage();
                      }));
                    },
                    icon: Badge(
                        label: Text(value.cartBox.length.toString()),
                        child: const Icon(Icons.shopping_cart_outlined)))
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, bottom: 10, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                plantItem.images,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              right: MediaQuery.of(context).size.width * 0.2,
                              child: Column(
                                children: List.generate(
                                    3,
                                    (dot) => Container(
                                          margin: const EdgeInsets.all(2),
                                          width: 5,
                                          height: dot == 0 ? 12 : 5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: dot == 0
                                                  ? const Color.fromRGBO(
                                                      118, 152, 75, 1)
                                                  : Colors.grey),
                                        )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        plantItem.name,
                        style: appstyle(
                            color: Colors.black, size: 20, ff: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        plantItem.description,
                        style: appstyle(
                            color: const Color.fromARGB(255, 141, 139, 139),
                            size: 14,
                            ff: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromRGBO(118, 152, 75, 1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildItemContainer(
                                icon: 'assets/icons/height.png',
                                parameters: plantItem.height,
                                title: 'Height'),
                            buildItemContainer(
                                icon: 'assets/icons/thermometer.png',
                                parameters: plantItem.height,
                                title: 'Temperature'),
                            buildItemContainer(
                                icon: 'assets/icons/potted-plant.png',
                                parameters: plantItem.pot,
                                title: 'Pot')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: appstyle(
                                      color: Colors.white,
                                      size: 18,
                                      ff: FontWeight.w600),
                                ),
                                Text(
                                  "\$ ${plantItem.price}",
                                  style: appstyle(
                                      color: Colors.white,
                                      size: 14,
                                      ff: FontWeight.bold),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                value.addToCart(plantItem);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                height: 50,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 63, 128, 65),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    'Add to Cart',
                                    style: appstyle(
                                        color: Colors.white,
                                        size: 14,
                                        ff: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget buildItemContainer(
      {required String icon,
      required String title,
      required String parameters}) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: 15,
          height: 25,
          color: Colors.white,
          fit: BoxFit.fitHeight,
        ),
        Text(
          title,
          style: appstyle(color: Colors.white, size: 10, ff: FontWeight.bold),
        ),
        Text(
          parameters,
          style: appstyle(color: Colors.white, size: 10, ff: FontWeight.w500),
        ),
      ],
    );
  }
}
