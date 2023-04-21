// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultAdapter extends TypeAdapter<Result> {
  @override
  final int typeId = 1;

  @override
  Result read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Result(
      businessStatus: fields[0] as String?,
      geometry: fields[1] as Geometry?,
      icon: fields[2] as String?,
      iconBackgroundColor: fields[3] as String?,
      iconMaskBaseUri: fields[4] as String?,
      name: fields[5] as String?,
      openingHours: fields[6] as OpeningHours?,
      photos: (fields[7] as List?)?.cast<Photo>(),
      placeId: fields[8] as String?,
      plusCode: fields[9] as PlusCode?,
      priceLevel: fields[10] as int?,
      rating: fields[11] as double?,
      reference: fields[12] as String?,
      scope: fields[13] as String?,
      types: (fields[14] as List?)?.cast<String>(),
      userRatingsTotal: fields[15] as int?,
      vicinity: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Result obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.businessStatus)
      ..writeByte(1)
      ..write(obj.geometry)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.iconBackgroundColor)
      ..writeByte(4)
      ..write(obj.iconMaskBaseUri)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.openingHours)
      ..writeByte(7)
      ..write(obj.photos)
      ..writeByte(8)
      ..write(obj.placeId)
      ..writeByte(9)
      ..write(obj.plusCode)
      ..writeByte(10)
      ..write(obj.priceLevel)
      ..writeByte(11)
      ..write(obj.rating)
      ..writeByte(12)
      ..write(obj.reference)
      ..writeByte(13)
      ..write(obj.scope)
      ..writeByte(14)
      ..write(obj.types)
      ..writeByte(15)
      ..write(obj.userRatingsTotal)
      ..writeByte(16)
      ..write(obj.vicinity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GeometryAdapter extends TypeAdapter<Geometry> {
  @override
  final int typeId = 2;

  @override
  Geometry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Geometry(
      location: fields[0] as Location?,
      viewport: fields[1] as Viewport?,
    );
  }

  @override
  void write(BinaryWriter writer, Geometry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.viewport);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeometryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 3;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      lat: fields[0] as double?,
      lng: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ViewportAdapter extends TypeAdapter<Viewport> {
  @override
  final int typeId = 4;

  @override
  Viewport read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Viewport(
      northeast: fields[0] as Location?,
      southwest: fields[1] as Location?,
    );
  }

  @override
  void write(BinaryWriter writer, Viewport obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.northeast)
      ..writeByte(1)
      ..write(obj.southwest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OpeningHoursAdapter extends TypeAdapter<OpeningHours> {
  @override
  final int typeId = 5;

  @override
  OpeningHours read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OpeningHours(
      openNow: fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, OpeningHours obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.openNow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpeningHoursAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 6;

  @override
  Photo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photo(
      height: fields[0] as int?,
      htmlAttributions: (fields[1] as List?)?.cast<String>(),
      photoReference: fields[2] as String?,
      width: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.height)
      ..writeByte(1)
      ..write(obj.htmlAttributions)
      ..writeByte(2)
      ..write(obj.photoReference)
      ..writeByte(3)
      ..write(obj.width);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlusCodeAdapter extends TypeAdapter<PlusCode> {
  @override
  final int typeId = 7;

  @override
  PlusCode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlusCode(
      compoundCode: fields[0] as String?,
      globalCode: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PlusCode obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.compoundCode)
      ..writeByte(1)
      ..write(obj.globalCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlusCodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
