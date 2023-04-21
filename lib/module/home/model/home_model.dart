// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'home_model.g.dart';

PlaceModel placeModelFromJson(String str) =>
    PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

class PlaceModel {
  PlaceModel({
    this.results,
    this.status,
  });

  List<Result>? results;
  String? status;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "status": status,
      };
}

@HiveType(typeId: 1)
class Result {
  Result({
    this.businessStatus,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.reference,
    this.scope,
    this.types,
    this.userRatingsTotal,
    this.vicinity,
  });

  @HiveField(0)
  String? businessStatus;

  @HiveField(1)
  Geometry? geometry;

  @HiveField(2)
  String? icon;

  @HiveField(3)
  String? iconBackgroundColor;

  @HiveField(4)
  String? iconMaskBaseUri;

  @HiveField(5)
  String? name;

  @HiveField(6)
  OpeningHours? openingHours;

  @HiveField(7)
  List<Photo>? photos;

  @HiveField(8)
  String? placeId;

  @HiveField(9)
  PlusCode? plusCode;

  @HiveField(10)
  int? priceLevel;

  @HiveField(11)
  double? rating;

  @HiveField(12)
  String? reference;

  @HiveField(13)
  String? scope;

  @HiveField(14)
  List<String>? types;

  @HiveField(15)
  int? userRatingsTotal;

  @HiveField(16)
  String? vicinity;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        businessStatus: json["business_status"],
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        icon: json["icon"],
        iconBackgroundColor: json["icon_background_color"],
        iconMaskBaseUri: json["icon_mask_base_uri"],
        name: json["name"],
        openingHours: json["opening_hours"] == null
            ? null
            : OpeningHours.fromJson(json["opening_hours"]),
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        placeId: json["place_id"],
        plusCode: json["plus_code"] == null
            ? null
            : PlusCode.fromJson(json["plus_code"]),
        priceLevel: json["price_level"],
        rating: json["rating"] == null
            ? null
            : int.tryParse(json["rating"].toString())?.toDouble(),
        reference: json["reference"],
        scope: json["scope"],
        types: json["types"] == null
            ? []
            : List<String>.from(json["types"]!.map((x) => x)),
        userRatingsTotal: json["user_ratings_total"],
        vicinity: json["vicinity"],
      );

  Map<String, dynamic> toJson() => {
        "business_status": businessStatus,
        "geometry": geometry?.toJson(),
        "icon": icon,
        "icon_background_color": iconBackgroundColor,
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        "opening_hours": openingHours?.toJson(),
        "photos": photos == null
            ? []
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "place_id": placeId,
        "plus_code": plusCode?.toJson(),
        "price_level": priceLevel,
        "rating": rating,
        "reference": reference,
        "scope": scope,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "user_ratings_total": userRatingsTotal,
        "vicinity": vicinity,
      };
}

@HiveType(typeId: 2)
class Geometry {
  Geometry({
    this.location,
    this.viewport,
  });

  @HiveField(0)
  Location? location;
  @HiveField(1)
  Viewport? viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        viewport: json["viewport"] == null
            ? null
            : Viewport.fromJson(json["viewport"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "viewport": viewport?.toJson(),
      };
}

@HiveType(typeId: 3)
class Location {
  Location({
    this.lat,
    this.lng,
  });

  @HiveField(0)
  double? lat;

  @HiveField(1)
  double? lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

@HiveType(typeId: 4)
class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  @HiveField(0)
  Location? northeast;

  @HiveField(1)
  Location? southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: json["northeast"] == null
            ? null
            : Location.fromJson(json["northeast"]),
        southwest: json["southwest"] == null
            ? null
            : Location.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast?.toJson(),
        "southwest": southwest?.toJson(),
      };
}

@HiveType(typeId: 5)
class OpeningHours {
  OpeningHours({
    this.openNow,
  });

  @HiveField(0)
  bool? openNow;

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"],
      );

  Map<String, dynamic> toJson() => {
        "open_now": openNow,
      };
}

@HiveType(typeId: 6)
class Photo {
  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  @HiveField(0)
  int? height;

  @HiveField(1)
  List<String>? htmlAttributions;

  @HiveField(2)
  String? photoReference;

  @HiveField(3)
  int? width;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions: json["html_attributions"] == null
            ? []
            : List<String>.from(json["html_attributions"]!.map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": htmlAttributions == null
            ? []
            : List<dynamic>.from(htmlAttributions!.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
      };
}

@HiveType(typeId: 7)
class PlusCode {
  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  @HiveField(0)
  String? compoundCode;

  @HiveField(1)
  String? globalCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
      );

  Map<String, dynamic> toJson() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
      };
}
