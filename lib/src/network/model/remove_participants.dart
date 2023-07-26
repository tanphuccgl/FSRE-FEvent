class RemoveParticipantsModel {
  String? checkinAt;
  String? checkoutAt;
  String? createdAt;
  Event? event;
  Student? student;

  RemoveParticipantsModel(
      {this.checkinAt,
      this.checkoutAt,
      this.createdAt,
      this.event,
      this.student});

  RemoveParticipantsModel.fromJson(Map<String, dynamic> json) {
    checkinAt = json['checkinAt'];
    checkoutAt = json['checkoutAt'];
    createdAt = json['createdAt'];
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['checkinAt'] = checkinAt;
    data['checkoutAt'] = checkoutAt;
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
