// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plantmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantsAdapter extends TypeAdapter<Plants> {
  @override
  final int typeId = 0;

  @override
  Plants read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Plants(
      id: fields[0] as int,
      quantity: fields[9] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      favorite: fields[5] as bool,
      images: fields[3] as String,
      height: fields[8] as String,
      pot: fields[6] as String,
      temperature: fields[7] as String,
      price: fields[4] as double,
    )..totalPrice = fields[10] as double;
  }

  @override
  void write(BinaryWriter writer, Plants obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.favorite)
      ..writeByte(6)
      ..write(obj.pot)
      ..writeByte(7)
      ..write(obj.temperature)
      ..writeByte(8)
      ..write(obj.height)
      ..writeByte(9)
      ..write(obj.quantity)
      ..writeByte(10)
      ..write(obj.totalPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
