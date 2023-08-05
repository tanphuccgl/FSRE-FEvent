class TicketModel {
  String? message;
  Data? data;

  TicketModel({this.message, this.data});

  TicketModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  int? amount;
  String? note;
  String? paymentMethod;
  Event? event;
  Participant? participant;
  String? donationId;
  String? createdAt;
  String? updatedAt;
  String? status;

  Data(
      {this.type,
      this.amount,
      this.note,
      this.paymentMethod,
      this.event,
      this.participant,
      this.donationId,
      this.createdAt,
      this.updatedAt,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    amount = json['amount'];
    note = json['note'];
    paymentMethod = json['paymentMethod'];
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
    participant = json['participant'] != null
        ? Participant.fromJson(json['participant'])
        : null;
    donationId = json['donationId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['amount'] = amount;
    data['note'] = note;
    data['paymentMethod'] = paymentMethod;
    if (event != null) {
      data['event'] = event!.toJson();
    }
    if (participant != null) {
      data['participant'] = participant!.toJson();
    }
    data['donationId'] = donationId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
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
  List<Categories>? categories;

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
      this.remainingAmount,
      this.categories});

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
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
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
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? categoryId;
  String? categoryName;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.categoryId,
      this.categoryName,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['description'] = description;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Participant {
  String? participantId;
  String? checkinAt;
  String? checkoutAt;
  String? status;
  String? createdAt;

  Participant(
      {this.participantId,
      this.checkinAt,
      this.checkoutAt,
      this.status,
      this.createdAt});

  Participant.fromJson(Map<String, dynamic> json) {
    participantId = json['participantId'];
    checkinAt = json['checkinAt'];
    checkoutAt = json['checkoutAt'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['participantId'] = participantId;
    data['checkinAt'] = checkinAt;
    data['checkoutAt'] = checkoutAt;
    data['status'] = status;
    data['createdAt'] = createdAt;
    return data;
  }
}
