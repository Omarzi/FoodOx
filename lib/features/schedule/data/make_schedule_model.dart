class MakeScheduleModel {
  Schedule? schedule;

  MakeScheduleModel({this.schedule});

  MakeScheduleModel.fromJson(Map<String, dynamic> json) {
    schedule = json['schedule'] != null
        ? new Schedule.fromJson(json['schedule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.toJson();
    }
    return data;
  }
}

class Schedule {
  String? user;
  String? workFrom;
  String? workTo;
  String? breakFrom;
  String? breakTo;
  String? period;
  bool? expired;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Schedule(
      {this.user,
        this.workFrom,
        this.workTo,
        this.breakFrom,
        this.breakTo,
        this.period,
        this.expired,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Schedule.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    workFrom = json['work_from'];
    workTo = json['work_to'];
    breakFrom = json['break_from'];
    breakTo = json['break_to'];
    period = json['period'];
    expired = json['expired'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['work_from'] = this.workFrom;
    data['work_to'] = this.workTo;
    data['break_from'] = this.breakFrom;
    data['break_to'] = this.breakTo;
    data['period'] = this.period;
    data['expired'] = this.expired;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
