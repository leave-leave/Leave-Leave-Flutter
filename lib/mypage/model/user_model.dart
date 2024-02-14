class model {
  String? accountId;
  String? name;

  model({this.accountId, this.name});

  model.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['name'] = this.name;
    return data;
  }
}