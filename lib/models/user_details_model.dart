class UserDetails {
  String? name;
  String? phoneNo;
  String? emailId;
  String? role;
  String? userId;

  UserDetails({this.name, this.phoneNo, this.emailId, this.role, this.userId});

  UserDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNo = json['phoneNo'];
    emailId = json['emailId'];
    role = json['role'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNo'] = phoneNo;
    data['emailId'] = emailId;
    data['role'] = role;
    data['userId'] = userId;
    return data;
  }
}
