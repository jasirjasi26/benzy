// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.user,
    this.reports,
  });

  User? user;
  List<Report>? reports;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    user: User.fromJson(json["user"]),
    reports: List<Report>.from(json["reports"].map((x) => Report.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "reports": List<dynamic>.from(reports!.map((x) => x.toJson())),
  };
}

class Report {
  Report({
    this.date,
    this.optIns,
  });

  String? date;
  dynamic optIns;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    date: json["date"],
    optIns: json["opt_ins"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "opt_ins": optIns,
  };
}

class OptInsClass {
  OptInsClass({
    this.breakfast,
    this.lunch,
    this.dinner,
  });

  Breakfast? breakfast;
  Breakfast? lunch;
  Breakfast? dinner;
  int? fine=0;

  factory OptInsClass.fromJson(Map<String, dynamic> json) => OptInsClass(
    breakfast: breakfastValues.map![json["breakfast"]],
    lunch: breakfastValues.map![json["lunch"]],
    dinner: breakfastValues.map![json["dinner"]],
  );

  Map<String, dynamic> toJson() => {
    "breakfast": breakfastValues.reverse![breakfast],
    "lunch": breakfastValues.reverse![lunch],
    "dinner": breakfastValues.reverse![dinner],
  };
}

enum Breakfast { PENDING, CANCELED, DELIVERED }

final breakfastValues = EnumValues({
  "Canceled": Breakfast.CANCELED,
  "Delivered": Breakfast.DELIVERED,
  "Pending": Breakfast.PENDING
});

class User {
  User({
    this.fName,
    this.lName,
    this.image,
  });

  String? fName;
  String? lName;
  dynamic image;

  factory User.fromJson(Map<String, dynamic> json) => User(
    fName: json["f_name"],
    lName: json["l_name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "f_name": fName,
    "l_name": lName,
    "image": image,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
