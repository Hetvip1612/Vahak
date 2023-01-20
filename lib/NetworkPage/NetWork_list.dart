// To parse this JSON data, do
//
//     final netWorkList = netWorkListFromJson(jsonString);

import 'dart:convert';

List<NetWorkList> netWorkListFromJson(String str) => List<NetWorkList>.from(json.decode(str).map((x) => NetWorkList.fromJson(x)));

String netWorkListToJson(List<NetWorkList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NetWorkList {
    NetWorkList({
        required this.id,
        required this.username,
        required this.currentLocation,
        required this.profileImage,
        required this.role,
    });

    int id;
    String username;
    String currentLocation;
    String profileImage;
    List<Role> role;

    factory NetWorkList.fromJson(Map<String, dynamic> json) => NetWorkList(
        id: json["id"],
        username: json["username"],
        currentLocation: json["current_location"],
        profileImage: json["profile_image"],
        role: List<Role>.from(json["role"].map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "current_location": currentLocation,
        "profile_image": profileImage,
        "role": List<dynamic>.from(role.map((x) => x.toJson())),
    };
}

class Role {
    Role({
        required this.id,
        required this.name,
    });

    int id;
    String name;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
