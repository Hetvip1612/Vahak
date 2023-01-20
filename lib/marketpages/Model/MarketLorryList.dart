// To parse this JSON data, do
//
//     final marketLorryList = marketLorryListFromJson(jsonString);

import 'dart:convert';

List<MarketLorryList?>? marketLorryListFromJson(String str) => json.decode(str) == null ? [] : List<MarketLorryList?>.from(json.decode(str)!.map((x) => MarketLorryList.fromJson(x)));

String marketLorryListToJson(List<MarketLorryList?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class MarketLorryList {
    MarketLorryList({
        this.id,
       required this.username,
       required this.profileImage,
       required this.uservehicleNumber,
      required  this.currentLocation,
        this.isAllPermit,
        this.isActive,
        this.isRcVerfied,
        this.user,
     required   this.vehicalTyres,
        this.vehicleType,
required this.vehicleLoadCapacity,
     required   this.vehicleName,
        this.permit,
    });

    int? id;
      String username;
    String? profileImage;
    String uservehicleNumber;

    String currentLocation;
    bool? isAllPermit;
    bool? isActive;
    bool? isRcVerfied;
    int? user;
    String  vehicalTyres;
    String? vehicleType;
    String vehicleLoadCapacity;
    String vehicleName;
    List<Permit?>? permit;

    factory MarketLorryList.fromJson(Map<String, dynamic> json) => MarketLorryList(
        id: json["id"],
         username: json["username"],
        profileImage: json["profile_image"],
        uservehicleNumber: json["uservehicle_number"],
        currentLocation: json["current_location"],
        isAllPermit: json["is_all_permit"],
        isActive: json["is_active"],
        isRcVerfied: json["is_rc_verfied"],
        user: json["user"],
        vehicalTyres: json["vehical_tyres"],
        vehicleType: json["vehicle_type"],
        vehicleLoadCapacity: json["vehicle_load_capacity"],
        vehicleName: json["vehicle_name"],
        permit: json["permit"] == null ? [] : List<Permit?>.from(json["permit"]!.map((x) => Permit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
         "username": username,
        "profile_image": profileImage,
        "uservehicle_number": uservehicleNumber,
        "current_location": currentLocation,
        "is_all_permit": isAllPermit,
        "is_active": isActive,
        "is_rc_verfied": isRcVerfied,
        "user": user,
        "vehical_tyres": vehicalTyres,
        "vehicle_type": vehicleType,
        "vehicle_load_capacity": vehicleLoadCapacity.toString(),
        "vehicle_name": vehicleName,
        "permit": permit == null ? [] : List<dynamic>.from(permit!.map((x) => x!.toJson())),
    };
}

class Permit {
    Permit({
        this.id,
      required this.name,
    });

    int? id;
    String name;

    factory Permit.fromJson(Map<String, dynamic> json) => Permit(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
