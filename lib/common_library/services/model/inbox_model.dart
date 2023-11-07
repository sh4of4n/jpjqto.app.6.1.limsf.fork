import 'package:hive/hive.dart';

part 'inbox_model.g.dart';

class GetNotificationListByUserIdResponse {
  List<MsgOutBox>? table1;

  GetNotificationListByUserIdResponse({this.table1});

  GetNotificationListByUserIdResponse.fromJson(Map<String, dynamic> json) {
    if (json['Table1'] != null) {
      table1 = List<MsgOutBox>.empty(growable: true);
      json['Table1'].forEach((v) {
        table1!.add(MsgOutBox.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (table1 != null) {
      data['Table1'] = table1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 4, adapterName: 'MsgOutboxAdapter')
class MsgOutBox {
  @HiveField(0)
  String? msgDoc;
  @HiveField(1)
  String? msgRef;
  @HiveField(2)
  String? msgType;
  @HiveField(3)
  String? sendMsg;

  MsgOutBox({this.msgDoc, this.msgRef, this.msgType, this.sendMsg});

  MsgOutBox.fromJson(Map<String, dynamic> json) {
    msgDoc = json['msg_doc'];
    msgRef = json['msg_ref'];
    msgType = json['msg_type'];
    sendMsg = json['send_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg_doc'] = msgDoc;
    data['msg_ref'] = msgRef;
    data['msg_type'] = msgType;
    data['send_msg'] = sendMsg;
    return data;
  }
}

class GetUnreadNotificationCountResponse {
  List<MsgCount>? msgCount;

  GetUnreadNotificationCountResponse({this.msgCount});

  GetUnreadNotificationCountResponse.fromJson(Map<String, dynamic> json) {
    if (json['MsgCount'] != null) {
      msgCount = List<MsgCount>.empty(growable: true);
      json['MsgCount'].forEach((v) {
        msgCount!.add(MsgCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (msgCount != null) {
      data['MsgCount'] = msgCount!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MsgCount {
  String? msgCount;

  MsgCount({this.msgCount});

  MsgCount.fromJson(Map<String, dynamic> json) {
    msgCount = json['msg_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg_count'] = msgCount;
    return data;
  }
}
