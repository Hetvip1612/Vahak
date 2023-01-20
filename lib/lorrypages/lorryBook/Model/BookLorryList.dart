// To parse this JSON data, do
//
//     final bookLorryList = bookLorryListFromJson(jsonString);

import 'dart:convert';

List<BookLorryList> bookLorryListFromJson(String str) => List<BookLorryList>.from(json.decode(str).map((x) => BookLorryList.fromJson(x)));

String bookLorryListToJson(List<BookLorryList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookLorryList {
    BookLorryList({
       required this.id,
        required this.comments,
       required this.postLoad,
      required  this.attachnewlorry,
    });

    int id;
    String comments;
    List<PostLoad> postLoad;
    List<Attachnewlorry> attachnewlorry;

    factory BookLorryList.fromJson(Map<String, dynamic> json) => BookLorryList(
        id: json["id"],
        comments: json["comments"],
        postLoad: List<PostLoad>.from(json["PostLoad"].map((x) => PostLoad.fromJson(x))),
        attachnewlorry: List<Attachnewlorry>.from(json["Attachnewlorry"].map((x) => Attachnewlorry.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comments": comments,
        "PostLoad": List<dynamic>.from(postLoad.map((x) => x.toJson())),
        "Attachnewlorry": List<dynamic>.from(attachnewlorry.map((x) => x.toJson())),
    };
}

class Attachnewlorry {
    Attachnewlorry({
      required  this.id,
      required  this.username,
      required  this.profileImage,
      required  this.uservehicleNumber,
       required this.currentLocation,
       required this.vehicleName,
      required  this.vehicleLoadCapacity,
      required  this.fixedPrice,
       required this.status,
    });

    int id;
    String username;
    String profileImage;
    String uservehicleNumber;
    String currentLocation;
    String vehicleName;
    String vehicleLoadCapacity;
    dynamic fixedPrice;
    String status;

    factory Attachnewlorry.fromJson(Map<String, dynamic> json) => Attachnewlorry(
        id: json["id"],
        username: json["username"],
        profileImage: json["profile_image"],
        uservehicleNumber: json["uservehicle_number"],
        currentLocation: json["current_location"],
        vehicleName: json["vehicle_name"],
        vehicleLoadCapacity: json["vehicle_load_capacity"],
        fixedPrice: json["fixed_price"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "profile_image": profileImage,
        "uservehicle_number": uservehicleNumber,
        "current_location": currentLocation,
        "vehicle_name": vehicleName,
        "vehicle_load_capacity": vehicleLoadCapacity,
        "fixed_price": fixedPrice,
        "status": status,
    };
}

class PostLoad {
    PostLoad({
      required  this.id,
      required  this.pickupLocation,
      required  this.dropLocation,
      required  this.quantity,
      required  this.materialName,
      required  this.status,
    });

    int id;
    String pickupLocation;
    String dropLocation;
    String quantity;
    String materialName;
    String status;

    factory PostLoad.fromJson(Map<String, dynamic> json) => PostLoad(
        id: json["id"],
        pickupLocation: json["pickup_location"],
        dropLocation: json["drop_location"],
        quantity: json["quantity"],
        materialName: json["material_name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pickup_location": pickupLocation,
        "drop_location": dropLocation,
        "quantity": quantity,
        "material_name": materialName,
        "status": status,
    };
}
