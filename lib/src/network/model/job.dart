class JobsModel {
  List<JobData>? data;
  int? count;

  JobsModel({this.data, this.count});

  JobsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <JobData>[];
      json['data'].forEach((v) {
        data!.add(JobData.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class JobData {
  String? jobId;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? status;
  int? quantity;
  int? remaining;
  int? salary;
  int? hourOfWork;
  String? position;
  Skill? skill;
  Event? event;
  List<JobRequests>? jobRequests;

  JobData(
      {this.jobId,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.status,
      this.quantity,
      this.remaining,
      this.salary,
      this.hourOfWork,
      this.position,
      this.skill,
      this.event,
      this.jobRequests});

  JobData.fromJson(Map<String, dynamic> json) {
    jobId = json['jobId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    status = json['status'];
    quantity = json['quantity'];
    remaining = json['remaining'];
    salary = json['salary'];
    hourOfWork = json['hourOfWork'];
    position = json['position'];
    skill = json['skill'] != null ? Skill.fromJson(json['skill']) : null;
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
    if (json['jobRequests'] != null) {
      jobRequests = <JobRequests>[];
      json['jobRequests'].forEach((v) {
        jobRequests!.add(JobRequests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jobId'] = jobId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['description'] = description;
    data['status'] = status;
    data['quantity'] = quantity;
    data['remaining'] = remaining;
    data['salary'] = salary;
    data['hourOfWork'] = hourOfWork;
    data['position'] = position;
    if (skill != null) {
      data['skill'] = skill!.toJson();
    }
    if (event != null) {
      data['event'] = event!.toJson();
    }
    if (jobRequests != null) {
      data['jobRequests'] = jobRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Skill {
  String? skillId;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Skill(
      {this.skillId,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt});

  Skill.fromJson(Map<String, dynamic> json) {
    skillId = json['skillId'];
    name = json['name'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skillId'] = skillId;
    data['name'] = name;
    data['description'] = description;
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

class JobRequests {
  String? jobRequestId;
  String? status;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  String? content;
  Student? student;

  JobRequests(
      {this.jobRequestId,
      this.status,
      this.paymentStatus,
      this.createdAt,
      this.updatedAt,
      this.content,
      this.student});

  JobRequests.fromJson(Map<String, dynamic> json) {
    jobRequestId = json['jobRequestId'];
    status = json['status'];
    paymentStatus = json['paymentStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    content = json['content'];
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jobRequestId'] = jobRequestId;
    data['status'] = status;
    data['paymentStatus'] = paymentStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['content'] = content;
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
