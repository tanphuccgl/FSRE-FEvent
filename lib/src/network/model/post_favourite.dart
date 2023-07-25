class PostFavouriteModel {
  String? status;
  Event? event;
  Student? student;
  String? interestId;
  String? createdAt;
  String? updatedAt;

  PostFavouriteModel(
      {this.status,
      this.event,
      this.student,
      this.interestId,
      this.createdAt,
      this.updatedAt});

  PostFavouriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
    interestId = json['interestId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (event != null) {
      data['event'] = event!.toJson();
    }
    if (student != null) {
      data['student'] = student!.toJson();
    }
    data['interestId'] = interestId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Event {
  String? eventId;
  String? title;
  String? topic;
  String? type;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? location;
  int? totalDonation;
  int? rating;
  int? cost;
  String? startDate;
  String? endDate;
  String? image;
  int? expectedAmount;
  int? remainingAmount;

  Event(
      {this.eventId,
      this.title,
      this.topic,
      this.type,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.location,
      this.totalDonation,
      this.rating,
      this.cost,
      this.startDate,
      this.endDate,
      this.image,
      this.expectedAmount,
      this.remainingAmount});

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    title = json['title'];
    topic = json['topic'];
    type = json['type'];
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    location = json['location'];
    totalDonation = json['totalDonation'];
    rating = json['rating'];
    cost = json['cost'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    image = json['image'];
    expectedAmount = json['expectedAmount'];
    remainingAmount = json['remainingAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = eventId;
    data['title'] = title;
    data['topic'] = topic;
    data['type'] = type;
    data['description'] = description;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['location'] = location;
    data['totalDonation'] = totalDonation;
    data['rating'] = rating;
    data['cost'] = cost;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['image'] = image;
    data['expectedAmount'] = expectedAmount;
    data['remainingAmount'] = remainingAmount;
    return data;
  }
}

class Student {
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

  Student(
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

  Student.fromJson(Map<String, dynamic> json) {
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
  Wallet? wallet;

  Account(
      {this.accountId,
      this.email,
      this.password,
      this.role,
      this.status,
      this.googleId,
      this.createdAt,
      this.deviceId,
      this.wallet});

  Account.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    status = json['status'];
    googleId = json['googleId'];
    createdAt = json['createdAt'];
    deviceId = json['deviceId'];
    wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
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
    if (wallet != null) {
      data['wallet'] = wallet!.toJson();
    }
    return data;
  }
}

class Wallet {
  String? walletId;
  String? balance;
  String? createdAt;
  String? updatedAt;

  Wallet({this.walletId, this.balance, this.createdAt, this.updatedAt});

  Wallet.fromJson(Map<String, dynamic> json) {
    walletId = json['walletId'];
    balance = json['balance'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['walletId'] = walletId;
    data['balance'] = balance;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
