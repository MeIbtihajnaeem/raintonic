import 'dart:convert';

class CitiesModel {
  bool error;
  String msg;
  List<String>? data;

  CitiesModel({
    this.error = true,
    this.msg = "",
    this.data = const [],
  });

  factory CitiesModel.fromRawJson(String str) =>
      CitiesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
        error: json["error"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
