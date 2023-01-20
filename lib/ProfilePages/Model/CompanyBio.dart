// To parse this JSON data, do
//
//     final companyBio = companyBioFromJson(jsonString);

import 'dart:convert';

CompanyBio companyBioFromJson(String str) => CompanyBio.fromJson(json.decode(str));

String companyBioToJson(CompanyBio data) => json.encode(data.toJson());

class CompanyBio {
    CompanyBio({
   required    this.companyStartDate,
      required  this.companyBio,
    });

    int companyStartDate;
    String companyBio;

    factory CompanyBio.fromJson(Map<String, dynamic> json) => CompanyBio(
        companyStartDate: json["company_start_date"],
        companyBio: json["company_bio"],
    );

    Map<String, dynamic> toJson() => {
        "company_start_date": companyStartDate,
        "company_bio": companyBio,
    };
}
