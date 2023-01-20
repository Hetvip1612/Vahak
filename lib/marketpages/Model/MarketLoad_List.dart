// To parse this JSON data, do
//
//     final marketLoadList = marketLoadListFromJson(jsonString);

import 'dart:convert';

List<MarketLoadList> marketLoadListFromJson(String str) => List<MarketLoadList>.from(json.decode(str).map((x) => MarketLoadList.fromJson(x)));

String marketLoadListToJson(List<MarketLoadList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarketLoadList {
    MarketLoadList({
      required  this.id,
      required  this.pickupLocation,
      required  this.dropLocation,
     required   this.vehicleName,
     required   this.vehicleType,
      required  this.materialName,
     required   this.quantity,
     required   this.exceptedPrice,
      required  this.odcConsignment,
     required   this.description,
     required   this.userId,
     required   this.profile_image,
     required   this.username,
    });

    int id;
    String pickupLocation;
    String dropLocation;
    String vehicleName;
    String vehicleType;
    String materialName;
    String quantity;
    String exceptedPrice;
    dynamic odcConsignment;
    String description;
    int userId;
    String profile_image;
    String username;

    factory MarketLoadList.fromJson(Map<String, dynamic> json) => MarketLoadList(
        id: json["id"],
        
        pickupLocation: json["pickup_location"],
        dropLocation: json["drop_location"],
        vehicleName: json["vehicle_name"],
        vehicleType: json["vehicle_type"],
        materialName: json["material_name"],
        quantity: json["quantity"],
        exceptedPrice: json["excepted_price"],
        odcConsignment: json["odc_consignment"],
        description: json["description"],
        userId: json["user_id"],
        username:json["username"],
        profile_image:json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pickup_location": pickupLocation,
        "drop_location": dropLocation,
        "vehicle_name": vehicleName,
        "vehicle_type": vehicleType,
        "material_name": materialName,
        "quantity": quantity,
        "excepted_price": exceptedPrice,
        "odc_consignment": odcConsignment,
        "description": description,
        "user_id": userId,
        "username":username,
        "profile_image":profile_image
    };
}
