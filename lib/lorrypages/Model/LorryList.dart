// To parse this JSON data, do
//
//     final lorryList = lorryListFromJson(jsonString);

import 'dart:convert';

List<LorryList> lorryListFromJson(String str) => List<LorryList>.from(json.decode(str).map((x) => LorryList.fromJson(x)));

String lorryListToJson(List<LorryList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LorryList {
    LorryList({
       required this.id,
      required  this.uservehicleNumber,
      required  this.currentLocation,
    //  required  this.isActive,
     required   this.vehicleLoadCapacity,
      required  this.vehicleName,
     required   this.routes,
     required   this.updatedDate,
 //    required   this.isDeactive,
 required this.status
    });

    int id;
    String status;
    String uservehicleNumber;
    String currentLocation;
    //bool isActive;
    String vehicleLoadCapacity;
    String vehicleName;
    List<RouteLorry> routes;
    String updatedDate;
  //  bool isDeactive;

    factory LorryList.fromJson(Map<String, dynamic> json) => LorryList(
        id: json["id"],
        uservehicleNumber: json["uservehicle_number"],
        currentLocation: json["current_location"],
       // isActive: json["is_active"],
        vehicleLoadCapacity: json["vehicle_load_capacity"],
        vehicleName: json["vehicle_name"],
        routes: List<RouteLorry>.from(json["routes"].map((x) => RouteLorry.fromJson(x))),
        updatedDate: json["updated_date"],
        status:json["status"]
      //  isDeactive: json["is_deactive"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uservehicle_number": uservehicleNumber,
        "current_location": currentLocation,
       // "is_active": isActive,
        "vehicle_load_capacity": vehicleLoadCapacity,
        "vehicle_name": vehicleName,
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "updated_date": updatedDate,
        "status":status
       /// "is_deactive": isDeactive,
    };
}

class RouteLorry {
    RouteLorry({
    required    this.name,
    });

    String name;

    factory RouteLorry.fromJson(Map<String, dynamic> json) => RouteLorry(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
