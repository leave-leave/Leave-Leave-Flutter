class plane_add {
  String? userId;
  String? title;
  String? startDate;
  String? endDate;

  plane_add({this.userId, this.title, this.startDate, this.endDate});

  plane_add.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}
