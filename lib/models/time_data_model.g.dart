// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeDataModelAdapter extends TypeAdapter<TimeDataModel> {
  @override
  final int typeId = 0;

  @override
  TimeDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeDataModel(
      duration: fields[0] as int?,
      increase: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TimeDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.duration)
      ..writeByte(1)
      ..write(obj.increase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
