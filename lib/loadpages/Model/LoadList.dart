// To parse this JSON data, do
//
//     final loadList = loadListFromJson(jsonString);

import 'dart:convert';

List<LoadList?>? loadListFromJson(String str) => json.decode(str) == null ? [] : List<LoadList?>.from(json.decode(str)!.map((x) => LoadList.fromJson(x)));

String loadListToJson(List<LoadList?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class LoadList {
    LoadList({
        this.id,
       required this.pickupLocation,
      required  this.dropLocation,
      required  this.quantity,
       required this.vehicleName,
        this.toPay,
        this.isExpired,
        this.isCompleted,
     required   this.exceptedPrice,
       required this.materialName,
        this.postloadDate,
        required this.status
    });

    int? id;
    String pickupLocation;
    String dropLocation;
    String quantity;
    String vehicleName;
    bool? toPay;
    bool? isExpired;
    bool? isCompleted;
    String exceptedPrice;
    String materialName;
    String? postloadDate;
    String status;

    factory LoadList.fromJson(Map<String, dynamic> json) => LoadList(
        id: json["id"],
        pickupLocation: json["pickup_location"],
        status:json['status'],
        dropLocation: json["drop_location"],
        quantity: json["quantity"],
        vehicleName: json["vehicle_name"],
        toPay: json["to_pay"],
        isExpired: json["is_expired"],
        isCompleted: json["is_completed"],
        exceptedPrice: json["excepted_price"],
        materialName: json["material_name"],
        postloadDate: json["postload_date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pickup_location": pickupLocation,
        "drop_location": dropLocation,
        "quantity": quantity,
        "vehicle_name": vehicleName,
        "to_pay": toPay,
        "is_expired": isExpired,
        "is_completed": isCompleted,
        "excepted_price": exceptedPrice,
        "material_name": materialName,
        "postload_date": postloadDate,
        "status":status
    };
}
