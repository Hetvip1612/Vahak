// To parse this JSON data, do
//
//     final userProfileData = userProfileDataFromJson(jsonString);

import 'dart:convert';

List<UserProfileData> userProfileDataFromJson(String str) => List<UserProfileData>.from(json.decode(str).map((x) => UserProfileData.fromJson(x)));

String userProfileDataToJson(List<UserProfileData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserProfileData {
    UserProfileData({
      required  this.profileImage,
      required  this.coverImage,
       required this.city,
       required this.name,
       required this.routes,
       required this.officeaddress,
       required this.postload,
       required this.services,
       required this.vehicleName,
    });

    String profileImage;
    String coverImage;
    String city;
    String name;
    List<Routes> routes;
    List<Officeaddress> officeaddress;
    Postload postload;
    List<String> services;
    List<dynamic> vehicleName;

    factory UserProfileData.fromJson(Map<String, dynamic> json) => UserProfileData(
        profileImage: json["profile_image"],
        coverImage: json["cover_image"],
        city: json["city"],
        name: json["name"],
        routes: List<Routes>.from(json["routes"].map((x) => Routes.fromJson(x))),
        officeaddress: List<Officeaddress>.from(json["officeaddress"].map((x) => Officeaddress.fromJson(x))),
        postload: Postload.fromJson(json["postload"]),
        services: List<String>.from(json["services"].map((x) => x)),
        vehicleName: List<dynamic>.from(json["vehicle_name"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "profile_image": profileImage,
        "cover_image": coverImage,
        "city": city,
        "name": name,
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "officeaddress": List<dynamic>.from(officeaddress.map((x) => x.toJson())),
        "postload": postload.toJson(),
        "services": List<dynamic>.from(services.map((x) => x)),
        "vehicle_name": List<dynamic>.from(vehicleName.map((x) => x)),
    };
}

class Officeaddress {
    Officeaddress({
      required  this.buildingNumber,
       required this.area,
       required this.landmark,
       required this.city,
       required this.pincode,
    });

    String buildingNumber;
    String area;
    String landmark;
    String city;
    String pincode;

    factory Officeaddress.fromJson(Map<String, dynamic> json) => Officeaddress(
        buildingNumber: json["building_number"],
        area: json["area"],
        landmark: json["landmark"],
        city: json["city"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "building_number": buildingNumber,
        "area": area,
        "landmark": landmark,
        "city": city,
        "pincode": pincode,
    };
}

class Postload {
    Postload({
    required    this.postLoadCount,
    });

    int postLoadCount;

    factory Postload.fromJson(Map<String, dynamic> json) => Postload(
        postLoadCount: json["post_load_count"],
    );

    Map<String, dynamic> toJson() => {
        "post_load_count": postLoadCount,
    };
}

class Routes {
    Routes({
      required  this.id,
      required  this.name,
    });

    int id;
    String name;

    factory Routes.fromJson(Map<String, dynamic> json) => Routes(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
