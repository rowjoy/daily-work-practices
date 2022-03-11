import 'dart:convert';

Countrys countrysFromJson(String str) => Countrys.fromJson(json.decode(str));

String countrysToJson(Countrys data) => json.encode(data.toJson());

class Countrys {
  Countrys({
    this.message,
    this.statusCode,
    this.countries,
  });

  String? message;
  int? statusCode;
  List<Country>? countries;

  factory Countrys.fromJson(Map<String, dynamic> json) => Countrys(
        message: json["message"],
        statusCode: json["statusCode"],
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.id,
    this.isoCode,
    this.code1,
    this.code2,
    this.code3,
    this.name,
    this.status,
    this.nationality,
    this.riskFactor,
    this.fiscalRef,
    this.isEuMember,
    this.seqId,
    this.code4,
    this.code5,
    this.chkBlkLst,
    this.callingCode,
  });

  int? id;
  String? isoCode;
  String? code1;
  String? code2;
  String? code3;
  String? name;
  int? status;
  String? nationality;
  String? riskFactor;
  String? fiscalRef;
  int? isEuMember;
  int? seqId;
  String? code4;
  String? code5;
  int? chkBlkLst;
  String? callingCode;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        isoCode: json["isoCode"],
        code1: json["code1"],
        code2: json["code2"],
        code3: json["code3"],
        name: json["name"],
        status: json["status"],
        nationality: json["nationality"],
        riskFactor: json["riskFactor"],
        fiscalRef: json["fiscalRef"],
        isEuMember: json["isEUMember"],
        seqId: json["seqId"],
        code4: json["code4"],
        code5: json["code5"],
        chkBlkLst: json["chkBlkLst"],
        callingCode: json["callingCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isoCode": isoCode,
        "code1": code1,
        "code2": code2,
        "code3": code3,
        "name": name,
        "status": status,
        "nationality": nationality,
        "riskFactor": riskFactor,
        "fiscalRef": fiscalRef,
        "isEUMember": isEuMember,
        "seqId": seqId,
        "code4": code4,
        "code5": code5,
        "chkBlkLst": chkBlkLst,
        "callingCode": callingCode,
      };
}
