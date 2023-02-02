// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dishItem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DishItemAdapter extends TypeAdapter<DishItem> {
  @override
  final int typeId = 0;

  @override
  DishItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DishItem(
      id: fields[0] as String,
      title: fields[1] as String,
      imageUrl: fields[2] as String,
      recipieDescription: (fields[4] as List).cast<String>(),
      vegetarian: fields[3] as bool,
      preparationTime: fields[5] as int,
      preparationCost: fields[6] as int,
      isFavourite: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DishItem obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.vegetarian)
      ..writeByte(4)
      ..write(obj.recipieDescription)
      ..writeByte(5)
      ..write(obj.preparationTime)
      ..writeByte(6)
      ..write(obj.preparationCost)
      ..writeByte(7)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DishItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
