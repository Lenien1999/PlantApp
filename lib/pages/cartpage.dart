import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/plantcontroller.dart';
import '../model/plantmodel.dart';
import '../style/textstyle.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
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
              centerTitle: true,
              title: Text(
                'Cart',
                style: appstyle(
                    color: Colors.black, size: 18, ff: FontWeight.bold),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Badge(
                        label: Text(value.cartBox.length.toString()),
                        child: const Icon(Icons.shopping_cart_outlined)))
              ],
            ),
            backgroundColor: const Color.fromARGB(255, 240, 235, 235),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                        itemCount: value.cartBox.length,
                        itemBuilder: (context, index) {
                          final items = value.cartBox[index];

                          void updateTotalPrice(Plants item) {
                            item.totalPrice = item.calculateTotalPrice();
                            setState(() {
                              // Update the UI
                            });
                          }

                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 5),
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
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        items.images,
                                        width: 100,
                                        height: 100,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            items.name,
                                            style: appstyle(
                                                color: Colors.black,
                                                size: 18,
                                                ff: FontWeight.w800),
                                          ),
                                          Text(
                                            '\$ ${items.price}',
                                            style: appstyle(
                                                color: Colors.grey,
                                                size: 18,
                                                ff: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  value.decreaseQty(items);
                                                  value.updatePrice;
                                                  updateTotalPrice(items);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: GestureDetector(
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                items.quantity.toString(),
                                                style: appstyle(
                                                    color: Colors.black,
                                                    size: 18,
                                                    ff: FontWeight.w800),
                                              ),
                                              const SizedBox(width: 8),
                                              GestureDetector(
                                                onTap: () {
                                                  value.increaseQty(items);
                                                  value.updatePrice;
                                                  updateTotalPrice(items);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'Total: \$${items.totalPrice.toStringAsFixed(2)}',
                                            style: appstyle(
                                                color: Colors.black,
                                                size: 18,
                                                ff: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                             value.removeCart(items);
                                            value.updatePrice;
                                          },
                                          icon: const Icon(
                                            Icons.delete_forever_sharp,
                                            color: Colors.grey,
                                          ))
                                    ]),
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Order Info',
                    style: appstyle(
                        color: Colors.black, size: 18, ff: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Discount',
                          style: appstyle(
                              color: Colors.grey,
                              size: 16,
                              ff: FontWeight.w800),
                        ),
                      ),
                      Text('20%',
                          style: appstyle(
                              color: Colors.greenAccent,
                              size: 16,
                              ff: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: appstyle(
                            color: Colors.black, size: 16, ff: FontWeight.bold),
                      ),
                      Text(
                        ' \$${value.updatePrice.toStringAsFixed(2)}',
                        style: appstyle(
                            color: Colors.black, size: 18, ff: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(118, 152, 75, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'Checkout',
                          style: appstyle(
                              color: Colors.white,
                              size: 18,
                              ff: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
