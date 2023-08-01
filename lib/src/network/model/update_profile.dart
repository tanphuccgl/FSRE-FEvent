class UpdateProfileModel {
  String? studentId;
  String? name;
  String? gender;
  String? phone;
  String? dateOfBirth;
  String? major;
  int? semester;
  String? createdAt;
  String? updatedAt;
  bool? isVerified;
  Account? account;

  UpdateProfileModel(
      {this.studentId,
      this.name,
      this.gender,
      this.phone,
      this.dateOfBirth,
      this.major,
      this.semester,
      this.createdAt,
      this.updatedAt,
      this.isVerified,
      this.account});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    name = json['name'];
    gender = json['gender'];
    phone = json['phone'];
    dateOfBirth = json['dateOfBirth'];
    major = json['major'];
    semester = json['semester'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isVerified = json['isVerified'];
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentId'] = studentId;
    data['name'] = name;
    data['gender'] = gender;
    data['phone'] = phone;
    data['dateOfBirth'] = dateOfBirth;
    data['major'] = major;
    data['semester'] = semester;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['isVerified'] = isVerified;
    if (account != null) {
      data['account'] = account!.toJson();
    }
    return data;
  }
}

class Account {
  String? accountId;
  String? email;
  String? password;
  String? role;
  String? status;
  String? googleId;
  String? createdAt;
  String? deviceId;

  Account(
      {this.accountId,
      this.email,
      this.password,
      this.role,
      this.status,
      this.googleId,
      this.createdAt,
      this.deviceId});

  Account.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    status = json['status'];
    googleId = json['googleId'];
    createdAt = json['createdAt'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountId'] = accountId;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['status'] = status;
    data['googleId'] = googleId;
    data['createdAt'] = createdAt;
    data['deviceId'] = deviceId;
    return data;
  }
}
