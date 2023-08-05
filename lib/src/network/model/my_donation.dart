class MyDonationModel {
  List<Data>? data;

  MyDonationModel({this.data});

  MyDonationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? donationId;
  String? type;
  int? amount;
  String? note;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? paymentMethod;
  Participant? participant;

  Data(
      {this.donationId,
      this.type,
      this.amount,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.paymentMethod,
      this.participant});

  Data.fromJson(Map<String, dynamic> json) {
    donationId = json['donationId'];
    type = json['type'];
    amount = json['amount'];
    note = json['note'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    paymentMethod = json['paymentMethod'];
    participant = json['participant'] != null
        ? Participant.fromJson(json['participant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['donationId'] = donationId;
    data['type'] = type;
    data['amount'] = amount;
    data['note'] = note;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
    data['paymentMethod'] = paymentMethod;
    if (participant != null) {
      data['participant'] = participant!.toJson();
    }
    return data;
  }
}

class Participant {
  String? participantId;
  String? checkinAt;
  String? checkoutAt;
  String? status;
  String? createdAt;
  Student? student;

  Participant(
      {this.participantId,
      this.checkinAt,
      this.checkoutAt,
      this.status,
      this.createdAt,
      this.student});

  Participant.fromJson(Map<String, dynamic> json) {
    participantId = json['participantId'];
    checkinAt = json['checkinAt'];
    checkoutAt = json['checkoutAt'];
    status = json['status'];
    createdAt = json['createdAt'];
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['participantId'] = participantId;
    data['checkinAt'] = checkinAt;
    data['checkoutAt'] = checkoutAt;
    data['status'] = status;
    data['createdAt'] = createdAt;
    if (student != null) {
      data['student'] = student!.toJson();
    }
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
      this.isVerified});

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
    return data;
  }
}
