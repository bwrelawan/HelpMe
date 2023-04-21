// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentSearchAdapter extends TypeAdapter<RecentSearch> {
  @override
  final int typeId = 0;

  @override
  RecentSearch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentSearch(
      fields[0] as String,
      (fields[1] as List?)?.cast<Result>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecentSearch obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.searchKeyword)
      ..writeByte(1)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentSearchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
