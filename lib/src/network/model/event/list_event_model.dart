import 'package:fevent/src/network/model/event/event_model.dart';

class ListEventModel {
  List<EventModel>? data;
  int? count;

  ListEventModel({this.data, this.count});

  ListEventModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EventModel>[];
      json['data'].forEach((v) {
        data!.add(EventModel.fromJson(v));
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
