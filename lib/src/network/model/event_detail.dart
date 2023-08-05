class EventDetailModel {
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
  List<Partners>? partners;
  Staff? staff;
  List<Donations>? donations;
  List<Categories>? categories;
  int? donationCount;

  EventDetailModel(
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
      this.partners,
      this.staff,
      this.donations,
      this.categories,
      this.donationCount});

  EventDetailModel.fromJson(Map<String, dynamic> json) {
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
    if (json['partners'] != null) {
      partners = <Partners>[];
      json['partners'].forEach((v) {
        partners!.add(Partners.fromJson(v));
      });
    }
    staff = json['staff'] != null ? Staff.fromJson(json['staff']) : null;
    if (json['donations'] != null) {
      donations = <Donations>[];
      json['donations'].forEach((v) {
        donations!.add(Donations.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    donationCount = json['donationCount'];
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
    if (partners != null) {
      data['partners'] = partners!.map((v) => v.toJson()).toList();
    }
    if (staff != null) {
      data['staff'] = staff!.toJson();
    }
    if (donations != null) {
      data['donations'] = donations!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['donationCount'] = donationCount;
    return data;
  }
}

class Partners {
  String? partnerId;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? status;

  Partners(
      {this.partnerId,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.status});

  Partners.fromJson(Map<String, dynamic> json) {
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
  Department? department;

  Staff(
      {this.staffId,
      this.name,
      this.gender,
      this.phone,
      this.dateOfBirth,
      this.createdAt,
      this.updatedAt,
      this.isVerified,
      this.quitDate,
      this.department});

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
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
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
    if (department != null) {
      data['department'] = department!.toJson();
    }
    return data;
  }
}

class Department {
  String? departmentId;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Department(
      {this.departmentId,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt});

  Department.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    name = json['name'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentId'] = departmentId;
    data['name'] = name;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Donations {
  String? donationId;
  String? type;
  int? amount;
  String? note;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? paymentMethod;

  Donations(
      {this.donationId,
      this.type,
      this.amount,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.paymentMethod});

  Donations.fromJson(Map<String, dynamic> json) {
    donationId = json['donationId'];
    type = json['type'];
    amount = json['amount'];
    note = json['note'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    paymentMethod = json['paymentMethod'];
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
