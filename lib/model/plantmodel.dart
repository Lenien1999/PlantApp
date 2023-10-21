import 'package:hive/hive.dart';

part 'plantmodel.g.dart';

@HiveType(typeId: 0)
class Plants {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  String images;
  @HiveField(4)
  double price;
  @HiveField(5)
  bool favorite;
  @HiveField(6)
  String pot;
  @HiveField(7)
  String temperature;
  @HiveField(8)
  String height;
  @HiveField(9)
  int quantity;
  @HiveField(10)
  double totalPrice;

  Plants({
    required this.id,
    this.quantity = 1,
    required this.name,
    required this.description,
    this.favorite = false,
    required this.images,
    required this.height,
    required this.pot,
    required this.temperature,
    required this.price,
  }) : totalPrice = price;

  double calculateTotalPrice() {
    return price * quantity;
  }
}

List<Plants> plantsList = [
  Plants(
      name: 'Lucky Jade Plant',
      description:
          'Plant make your life with minimal and happy love the plant more and enjoy your day',
      images: 'assets/images/plant1.png',
      height: '30cm to 50cm',
      pot: 'Ceramic',
      price: 20,
      temperature: '20-30',
      id: 1),
  Plants(
      name: 'Snake Plant',
      description:
          'Plant make your life with minimal and happy love the plant more and enjoy your day',
      images: 'assets/images/plant2.png',
      height: '10cm to 20cm',
      pot: 'Ceramic',
      temperature: '25-30',
      price: 30,
      id: 2),
  Plants(
      temperature: '20-22',
      name: 'Large Plant',
      description:
          'Plant make your life with minimal and happy love the plant more and enjoy your day',
      images: 'assets/images/plant3.png',
      height: '30cm to 50cm',
      pot: 'Pot',
      price: 60,
      id: 3),
  Plants(
      temperature: '23-30',
      name: 'Green Plant',
      description:
          'Plant make your life with minimal and happy love the plant more and enjoy your day',
      images: 'assets/images/plant4.png',
      height: '30cm to 50cm',
      pot: 'Pot',
      price: 50,
      id: 4),
  Plants(
      temperature: '15-20',
      name: 'Lucky Jade Plant',
      description:
          'Plant make your life with minimal and happy love the plant more and enjoy your day',
      images: 'assets/images/plant5.png',
      height: '30cm to 50cm',
      pot: 'Ceramic',
      price: 90,
      id: 5),
  Plants(
      temperature: '25-30',
      name: 'Hibicus Plant',
      description:
          'Plant make your life with minimal and happy love the plant more and enjoy your day',
      images: 'assets/images/plant6.png',
      height: '10cm to 20cm',
      pot: 'Ceramic',
      price: 20,
      id: 6),
  Plants(
      temperature: '26-30',
      name: 'Locust Plant',
      description:
          'Plant make your life with minimal and happy love the plant more and enjoy your day',
      images: 'assets/images/plant7.png',
      height: '30cm to 50cm',
      pot: 'Pot',
      price: 20,
      id: 7),
  Plants(
      temperature: '25-33',
      name: 'Efficent Plant',
      description:
          'Plant make your life with minimal and happy love the plant more and enjoy your day',
      images: 'assets/images/plant8.png',
      height: '30cm to 50cm',
      pot: 'Pot',
      price: 20,
      id: 8),
];
