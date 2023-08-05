class FeedbackModel {
  int? satisfaction;
  int? contentQuality;
  int? organization;
  int? speakerQuality;
  String? like;
  String? dislike;
  Event? event;
  Participant? participant;

  FeedbackModel(
      {this.satisfaction,
      this.contentQuality,
      this.organization,
      this.speakerQuality,
      this.like,
      this.dislike,
      this.event,
      this.participant});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    satisfaction = json['satisfaction'];
    contentQuality = json['contentQuality'];
    organization = json['organization'];
    speakerQuality = json['speakerQuality'];
    like = json['like'];
    dislike = json['dislike'];
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
    participant = json['participant'] != null
        ? Participant.fromJson(json['participant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['satisfaction'] = satisfaction;
    data['contentQuality'] = contentQuality;
    data['organization'] = organization;
    data['speakerQuality'] = speakerQuality;
    data['like'] = like;
    data['dislike'] = dislike;
    if (event != null) {
      data['event'] = event!.toJson();
    }
    if (participant != null) {
      data['participant'] = participant!.toJson();
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
