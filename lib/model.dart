// To parse this JSON data, do
//
//     final purch = purchFromJson(jsonString);

import 'dart:convert';

Purch purchFromJson(String str) => Purch.fromJson(json.decode(str));

String purchToJson(Purch data) => json.encode(data.toJson());

class Purch {
  Purch({
    this.product,
    this.version,
    this.shortened,
  });

  String product;
  double version;
  List<Shortened> shortened;

  factory Purch.fromJson(Map<String, dynamic> json) => Purch(
    product: json["product"],
    version: json["version"].toDouble(),
    shortened: List<Shortened>.from(json["shortened"].map((x) => Shortened.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "version": version,
    "shortened": List<dynamic>.from(shortened.map((x) => x.toJson())),
  };
}

class Shortened {
  Shortened({
    this.originParamater,
    this.shortUrl,
  });

  String originParamater;
  String shortUrl;

  factory Shortened.fromJson(Map<String, dynamic> json) => Shortened(
    originParamater: json["origin_paramater"],
    shortUrl: json["short_url"],
  );

  Map<String, dynamic> toJson() => {
    "origin_paramater": originParamater,
    "short_url": shortUrl,
  };
}
