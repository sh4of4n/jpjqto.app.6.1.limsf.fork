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
      {this.wsCodeCrypt,
      this.caUid,
      this.caPwd,
      this.userId,
      this.permitCode});

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
