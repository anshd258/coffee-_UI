class CafeTimingsModel {
  List<CafeTimings>? cafeTimings;
  String? message;

  CafeTimingsModel({this.cafeTimings, this.message});

  CafeTimingsModel.fromJson(Map<String, dynamic> json) {
    if (json['cafeTimings'] != null) {
      cafeTimings = <CafeTimings>[];
      json['cafeTimings'].forEach((v) {
        cafeTimings!.add(CafeTimings.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (cafeTimings != null) {
      data['cafeTimings'] = cafeTimings!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class CafeTimings {
  String? day;
  String? openTime;
  String? closeTime;

  CafeTimings({this.day, this.openTime, this.closeTime});

  CafeTimings.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['day'] = day;
    data['openTime'] = openTime;
    data['closeTime'] = closeTime;
    return data;
  }
}
