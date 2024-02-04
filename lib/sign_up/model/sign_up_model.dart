class model {
  String? accountId;
  String? password;
  String? name;
  String? phoneNumber;

  model({this.accountId, this.password, this.name, this.phoneNumber});

  model.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    password = json['password'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountId'] = this.accountId;
    data['password'] = this.password;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
