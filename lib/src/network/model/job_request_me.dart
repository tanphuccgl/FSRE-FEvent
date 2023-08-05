class JobRequestMeModel {
  List<JobRequest>? jobRequest;

  JobRequestMeModel({this.jobRequest});

  JobRequestMeModel.fromJson(Map<String, dynamic> json) {
    if (json['jobRequest'] != null) {
      jobRequest = <JobRequest>[];
      json['jobRequest'].forEach((v) {
        jobRequest!.add(JobRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jobRequest != null) {
      data['jobRequest'] = jobRequest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobRequest {
  String? jobRequestId;
  String? status;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  String? content;
  Job? job;
  Student? student;

  JobRequest(
      {this.jobRequestId,
      this.status,
      this.paymentStatus,
      this.createdAt,
      this.updatedAt,
      this.content,
      this.job,
      this.student});

  JobRequest.fromJson(Map<String, dynamic> json) {
    jobRequestId = json['jobRequestId'];
    status = json['status'];
    paymentStatus = json['paymentStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    content = json['content'];
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
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
    if (job != null) {
      data['job'] = job!.toJson();
    }
    if (student != null) {
      data['student'] = student!.toJson();
    }
    return data;
  }
}

class Job {
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

  Job(
      {this.jobId,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.status,
      this.quantity,
      this.remaining,
      this.salary,
      this.hourOfWork,
      this.position});

  Job.fromJson(Map<String, dynamic> json) {
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
