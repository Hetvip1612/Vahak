// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

List<Address> addressFromJson(String str) => List<Address>.from(json.decode(str).map((x) => Address.fromJson(x)));

String addressToJson(List<Address> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address {
   
    Address({
       required this.user,
       required this.buildingNumber,
       required this.area,
      required  this.landmark,
      required  this.city,
       required this.pincode,
    });

    int user;
    String buildingNumber;
    String area;
    String landmark;
    String city;
    String pincode;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        user: json["user"],
        buildingNumber: json["building_number"],
        area: json["area"],
        landmark: json["landmark"] == null ? null : json["landmark"],
        city: json["city"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "building_number": buildingNumber,
        "area": area,
        "landmark": landmark == null ? null : landmark,
        "city": city,
        "pincode": pincode,
    };
}
