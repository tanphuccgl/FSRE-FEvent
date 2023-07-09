class EventModel {
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
  String? startDate;
  String? endDate;
  String? image;
  int? expectedAmount;
  int? remainingAmount;
  Partner? partner;
  Staff? staff;

  EventModel(
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
      this.startDate,
      this.endDate,
      this.image,
      this.expectedAmount,
      this.remainingAmount,
      this.partner,
      this.staff});

  EventModel.fromJson(Map<String, dynamic> json) {
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
    startDate = json['startDate'];
    endDate = json['endDate'];
    image = json['image'];
    expectedAmount = json['expectedAmount'];
    remainingAmount = json['remainingAmount'];
    partner =
        json['partner'] != null ? Partner.fromJson(json['partner']) : null;
    staff = json['staff'] != null ? Staff.fromJson(json['staff']) : null;
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
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['image'] = image;
    data['expectedAmount'] = expectedAmount;
    data['remainingAmount'] = remainingAmount;
    if (partner != null) {
      data['partner'] = partner!.toJson();
    }
    if (staff != null) {
      data['staff'] = staff!.toJson();
    }
    return data;
  }
}

class Partner {
  String? partnerId;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? status;

  Partner(
      {this.partnerId,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.status});

  Partner.fromJson(Map<String, dynamic> json) {
    partnerId = json['partnerId'];
    name = json['name'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['partnerId'] = partnerId;
    data['name'] = name;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
    return data;
  }
}

class Staff {
  String? staffId;
  String? name;
  String? gender;
  String? phone;
  String? dateOfBirth;
  String? createdAt;
  String? updatedAt;
  bool? isVerified;
  String? quitDate;

  Staff(
      {this.staffId,
      this.name,
      this.gender,
      this.phone,
      this.dateOfBirth,
      this.createdAt,
      this.updatedAt,
      this.isVerified,
      this.quitDate});

  Staff.fromJson(Map<String, dynamic> json) {
    staffId = json['staffId'];
    name = json['name'];
    gender = json['gender'];
    phone = json['phone'];
    dateOfBirth = json['dateOfBirth'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isVerified = json['isVerified'];
    quitDate = json['quitDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staffId'] = staffId;
    data['name'] = name;
    data['gender'] = gender;
    data['phone'] = phone;
    data['dateOfBirth'] = dateOfBirth;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['isVerified'] = isVerified;
    data['quitDate'] = quitDate;
    return data;
  }
}
