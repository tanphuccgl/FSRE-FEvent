class CheckParticipantsModel {
  String? participantId;
  String? checkinAt;
  String? checkoutAt;
  String? createdAt;

  CheckParticipantsModel(
      {this.participantId, this.checkinAt, this.checkoutAt, this.createdAt});

  CheckParticipantsModel.fromJson(Map<String, dynamic> json) {
    participantId = json['participantId'];
    checkinAt = json['checkinAt'];
    checkoutAt = json['checkoutAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['participantId'] = participantId;
    data['checkinAt'] = checkinAt;
    data['checkoutAt'] = checkoutAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
