class GetScheduleModel {
  Schedule? schedule;
  bool? exists;

  GetScheduleModel({this.schedule, this.exists});

  GetScheduleModel.fromJson(Map<String, dynamic> json) {
    schedule = json['schedule'] != null
        ? Schedule.fromJson(json['schedule'])
        : null;
    exists = json['exists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (schedule != null) {
      data['schedule'] = schedule!.toJson();
    }
    data['exists'] = exists;
    return data;
  }
}




class Schedule {
  String? sId;
  String? user;
  String? workFrom;
  String? workTo;
  String? breakFrom;
  String? breakTo;
  String? period;
  List<int>? days;
  bool? expired;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Schedule(
      {this.sId,
        this.user,
        this.workFrom,
        this.workTo,
        this.breakFrom,
        this.breakTo,
        this.period,
        this.days,
        this.expired,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Schedule.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    workFrom = json['work_from'];
    workTo = json['work_to'];
    breakFrom = json['break_from'];
    breakTo = json['break_to'];
    period = json['period'];
    days = json['days'].cast<int>();
    expired = json['expired'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['work_from'] = this.workFrom;
    data['work_to'] = this.workTo;
    data['break_from'] = this.breakFrom;
    data['break_to'] = this.breakTo;
    data['period'] = this.period;
    data['days'] = this.days;
    data['expired'] = this.expired;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}







//
// class Schedule {
//   String? sId;
//   String? user;
//   String? workFrom;
//   String? workTo;
//   String? breakFrom;
//   String? breakTo;
//   String? period;
//   bool? expired;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   Schedule(
//       {this.sId,
//         this.user,
//         this.workFrom,
//         this.workTo,
//         this.breakFrom,
//         this.breakTo,
//         this.period,
//         this.expired,
//         this.createdAt,
//         this.updatedAt,
//         this.iV});
//
//   Schedule.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     user = json['user'];
//     workFrom = json['work_from'];
//     workTo = json['work_to'];
//     breakFrom = json['break_from'];
//     breakTo = json['break_to'];
//     period = json['period'];
//     expired = json['expired'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = sId;
//     data['user'] = user;
//     data['work_from'] = workFrom;
//     data['work_to'] = workTo;
//     data['break_from'] = breakFrom;
//     data['break_to'] = breakTo;
//     data['period'] = period;
//     data['expired'] = expired;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = iV;
//     return data;
//   }
// }
//


