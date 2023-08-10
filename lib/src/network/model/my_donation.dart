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
  Event? event;
  Student? student;

  Participant(
      {this.participantId,
      this.checkinAt,
      this.checkoutAt,
      this.status,
      this.createdAt,
      this.event,
      this.student});

  Participant.fromJson(Map<String, dynamic> json) {
    participantId = json['participantId'];
    checkinAt = json['checkinAt'];
    checkoutAt = json['checkoutAt'];
    status = json['status'];
    createdAt = json['createdAt'];
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
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
    if (event != null) {
      data['event'] = event!.toJson();
    }
    if (student != null) {
      data['student'] = student!.toJson();
    }
    return data;
  }
}

class Event {
  String? eventId;
  String? title;
  String? topic;
  String? description;
  bool? isOnline;
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
      this.description,
      this.isOnline,
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
    description = json['description'];
    isOnline = json['isOnline'];
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
    data['description'] = description;
    data['isOnline'] = isOnline;
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
