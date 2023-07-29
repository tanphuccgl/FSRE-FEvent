class UpdateProfileModel {
  String? name;
  String? phone;
  int? semester;
  String? major;
  String? gender;
  String? dateOfBirth;
  Account? account;
  String? studentId;
  String? createdAt;
  String? updatedAt;
  bool? isVerified;

  UpdateProfileModel(
      {this.name,
      this.phone,
      this.semester,
      this.major,
      this.gender,
      this.dateOfBirth,
      this.account,
      this.studentId,
      this.createdAt,
      this.updatedAt,
      this.isVerified});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    semester = json['semester'];
    major = json['major'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
    studentId = json['studentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['semester'] = semester;
    data['major'] = major;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['studentId'] = studentId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['isVerified'] = isVerified;
    return data;
  }
}

class Account {
  String? email;
  String? password;
  String? role;
  String? status;
  Wallet? wallet;
  String? googleId;
  String? deviceId;
  String? accountId;
  String? createdAt;

  Account(
      {this.email,
      this.password,
      this.role,
      this.status,
      this.wallet,
      this.googleId,
      this.deviceId,
      this.accountId,
      this.createdAt});

  Account.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    role = json['role'];
    status = json['status'];
    wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    googleId = json['googleId'];
    deviceId = json['deviceId'];
    accountId = json['accountId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['status'] = status;
    if (wallet != null) {
      data['wallet'] = wallet!.toJson();
    }
    data['googleId'] = googleId;
    data['deviceId'] = deviceId;
    data['accountId'] = accountId;
    data['createdAt'] = createdAt;
    return data;
  }
}

class Wallet {
  int? balance;
  String? walletId;
  String? createdAt;
  String? updatedAt;

  Wallet({this.balance, this.walletId, this.createdAt, this.updatedAt});

  Wallet.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    walletId = json['walletId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['walletId'] = walletId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
