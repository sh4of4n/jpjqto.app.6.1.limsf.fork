class RuleResponse {
  List<Rule>? rule;

  RuleResponse({this.rule});

  RuleResponse.fromJson(Map<String, dynamic> json) {
    if (json['Rule'] != null) {
      rule = <Rule>[];
      json['Rule'].forEach((v) {
        rule!.add(new Rule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rule != null) {
      data['Rule'] = this.rule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rule {
  String? iD;
  String? ruleCode;
  String? elementCode;
  String? elementId;
  String? seqNo;
  String? mandatory;
  String? ruleDesc;
  String? createUser;
  String? createDate;
  String? editUser;
  String? editDate;
  String? transtamp;
  String? lastupload;
  String? compCode;
  String? branchCode;
  String? deleted;
  bool? isCheck;

  Rule(
      {this.iD,
      this.ruleCode,
      this.elementCode,
      this.elementId,
      this.seqNo,
      this.mandatory,
      this.ruleDesc,
      this.createUser,
      this.createDate,
      this.editUser,
      this.editDate,
      this.transtamp,
      this.lastupload,
      this.compCode,
      this.branchCode,
      this.deleted,
      this.isCheck});

  Rule.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    ruleCode = json['rule_code'];
    elementCode = json['element_code'];
    elementId = json['element_id'];
    seqNo = json['seq_no'];
    mandatory = json['mandatory'];
    ruleDesc = json['rule_desc'];
    createUser = json['create_user'];
    createDate = json['create_date'];
    editUser = json['edit_user'];
    editDate = json['edit_date'];
    transtamp = json['transtamp'];
    lastupload = json['lastupload'];
    compCode = json['comp_code'];
    branchCode = json['branch_code'];
    deleted = json['deleted'];
    isCheck = json['is_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['rule_code'] = this.ruleCode;
    data['element_code'] = this.elementCode;
    data['element_id'] = this.elementId;
    data['seq_no'] = this.seqNo;
    data['mandatory'] = this.mandatory;
    data['rule_desc'] = this.ruleDesc;
    data['create_user'] = this.createUser;
    data['create_date'] = this.createDate;
    data['edit_user'] = this.editUser;
    data['edit_date'] = this.editDate;
    data['transtamp'] = this.transtamp;
    data['lastupload'] = this.lastupload;
    data['comp_code'] = this.compCode;
    data['branch_code'] = this.branchCode;
    data['deleted'] = this.deleted;
    data['is_check'] = this.isCheck;
    return data;
  }
}

class ResultRequest {
  String? wsCodeCrypt;
  String? caUid;
  String? caPwd;
  String? userId;
  String? permitCode;

  ResultRequest(
      {this.wsCodeCrypt, this.caUid, this.caPwd, this.userId, this.permitCode});

  ResultRequest.fromJson(Map<String, dynamic> json) {
    wsCodeCrypt = json['wsCodeCrypt'];
    caUid = json['caUid'];
    caPwd = json['caPwd'];
    userId = json['userId'];
    permitCode = json['permitCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wsCodeCrypt'] = this.wsCodeCrypt;
    data['caUid'] = this.caUid;
    data['caPwd'] = this.caPwd;
    data['userId'] = this.userId;
    data['permitCode'] = this.permitCode;
    return data;
  }
}

class OwnerIdCategoryResponse {
  List<OwnerIdCategoryList>? ownerIdCategoryList;

  OwnerIdCategoryResponse({this.ownerIdCategoryList});

  OwnerIdCategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['OwnerIdCategoryList'] != null) {
      ownerIdCategoryList = <OwnerIdCategoryList>[];
      json['OwnerIdCategoryList'].forEach((v) {
        ownerIdCategoryList!.add(new OwnerIdCategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ownerIdCategoryList != null) {
      data['OwnerIdCategoryList'] =
          this.ownerIdCategoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OwnerIdCategoryList {
  String? ownerCat;
  String? ownerCatDesc;

  OwnerIdCategoryList({this.ownerCat, this.ownerCatDesc});

  OwnerIdCategoryList.fromJson(Map<String, dynamic> json) {
    ownerCat = json['owner_cat'];
    ownerCatDesc = json['owner_cat_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['owner_cat'] = this.ownerCat;
    data['owner_cat_desc'] = this.ownerCatDesc;
    return data;
  }
}

class MySikapVehicleListResponse {
  List<MysikapVehicle>? mysikapVehicle;

  MySikapVehicleListResponse({this.mysikapVehicle});

  MySikapVehicleListResponse.fromJson(Map<String, dynamic> json) {
    if (json['MysikapVehicle'] != null) {
      mysikapVehicle = <MysikapVehicle>[];
      json['MysikapVehicle'].forEach((v) {
        mysikapVehicle!.add(new MysikapVehicle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mysikapVehicle != null) {
      data['MysikapVehicle'] =
          this.mysikapVehicle!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MysikapVehicle {
  String? iD;
  String? plateNo;
  String? groupId;
  String? createUser;
  String? createDate;
  String? editUser;
  String? editDate;
  String? transtamp;
  String? lastupload;
  String? compCode;
  String? branchCode;
  String? deleted;
  String? checked;
  String? carNo;

  MysikapVehicle(
      {this.iD,
      this.plateNo,
      this.groupId,
      this.createUser,
      this.createDate,
      this.editUser,
      this.editDate,
      this.transtamp,
      this.lastupload,
      this.compCode,
      this.branchCode,
      this.deleted,
      this.checked,
      this.carNo});

  MysikapVehicle.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    plateNo = json['plate_no'];
    groupId = json['group_id'];
    createUser = json['create_user'];
    createDate = json['create_date'];
    editUser = json['edit_user'];
    editDate = json['edit_date'];
    transtamp = json['transtamp'];
    lastupload = json['lastupload'];
    compCode = json['comp_code'];
    branchCode = json['branch_code'];
    deleted = json['deleted'];
    checked = json['checked'];
    carNo = json['car_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['plate_no'] = this.plateNo;
    data['group_id'] = this.groupId;
    data['create_user'] = this.createUser;
    data['create_date'] = this.createDate;
    data['edit_user'] = this.editUser;
    data['edit_date'] = this.editDate;
    data['transtamp'] = this.transtamp;
    data['lastupload'] = this.lastupload;
    data['comp_code'] = this.compCode;
    data['branch_code'] = this.branchCode;
    data['deleted'] = this.deleted;
    data['checked'] = this.checked;
    data['car_no'] = this.carNo;
    return data;
  }
}

class QtoUjianLogoutRequest {
  String? wsCodeCrypt;
  String? caUid;
  String? caPwd;
  String? appId;
  String? appVersion;
  String? mySikapId;
  String? permitCode;

  QtoUjianLogoutRequest(
      {this.wsCodeCrypt,
      this.caUid,
      this.caPwd,
      this.appId,
      this.appVersion,
      this.mySikapId,
      this.permitCode});

  QtoUjianLogoutRequest.fromJson(Map<String, dynamic> json) {
    wsCodeCrypt = json['wsCodeCrypt'];
    caUid = json['caUid'];
    caPwd = json['caPwd'];
    appId = json['appId'];
    appVersion = json['appVersion'];
    mySikapId = json['mySikapId'];
    permitCode = json['permitCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wsCodeCrypt'] = this.wsCodeCrypt;
    data['caUid'] = this.caUid;
    data['caPwd'] = this.caPwd;
    data['appId'] = this.appId;
    data['appVersion'] = this.appVersion;
    data['mySikapId'] = this.mySikapId;
    data['permitCode'] = this.permitCode;
    return data;
  }
}

class QtoUjianLogoutResponse {
  List<Result>? result;

  QtoUjianLogoutResponse({this.result});

  QtoUjianLogoutResponse.fromJson(Map<String, dynamic> json) {
    if (json['Result'] != null) {
      result = <Result>[];
      json['Result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? result;

  Result({this.result});

  Result.fromJson(Map<String, dynamic> json) {
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    return data;
  }
}

class QtoUjianLoginResponse {
  List<QtoUjianLoginResult>? result;

  QtoUjianLoginResponse({this.result});

  QtoUjianLoginResponse.fromJson(Map<String, dynamic> json) {
    if (json['Result'] != null) {
      result = <QtoUjianLoginResult>[];
      json['Result'].forEach((v) {
        result!.add(new QtoUjianLoginResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QtoUjianLoginResult {
  String? result;
  String? userId;

  QtoUjianLoginResult({this.result, this.userId});

  QtoUjianLoginResult.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['user_id'] = this.userId;
    return data;
  }
}

class GetUserIdByMySikapIdResult {
  List<Result2>? result;

  GetUserIdByMySikapIdResult({this.result});

  GetUserIdByMySikapIdResult.fromJson(Map<String, dynamic> json) {
    if (json['Result'] != null) {
      result = <Result2>[];
      json['Result'].forEach((v) {
        result!.add(new Result2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result2 {
  String? userId;
  String? mysikapId;
  String? firstName;
  String? lastName;
  String? roleCode;
  String? roleDesc;

  Result2(
      {this.userId,
      this.mysikapId,
      this.firstName,
      this.lastName,
      this.roleCode,
      this.roleDesc});

  Result2.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mysikapId = json['mysikap_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    roleCode = json['role_code'];
    roleDesc = json['role_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['mysikap_id'] = this.mysikapId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['role_code'] = this.roleCode;
    data['role_desc'] = this.roleDesc;
    return data;
  }
}

class CheckUserLoginStatusResponse {
  List<ResultCheckUserLoginStatus>? result;

  CheckUserLoginStatusResponse({this.result});

  CheckUserLoginStatusResponse.fromJson(Map<String, dynamic> json) {
    if (json['Result'] != null) {
      result = <ResultCheckUserLoginStatus>[];
      json['Result'].forEach((v) {
        result!.add(new ResultCheckUserLoginStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultCheckUserLoginStatus {
  String? result;
  String? userId;

  ResultCheckUserLoginStatus({this.result, this.userId});

  ResultCheckUserLoginStatus.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['user_id'] = this.userId;
    return data;
  }
}
