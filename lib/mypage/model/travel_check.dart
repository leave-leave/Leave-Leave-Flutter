class travel_check {
  int? planId;
  String? startDate;
  String? endDate;
  String? title;
  List<String>? todoList;

  travel_check(
      {this.planId, this.startDate, this.endDate, this.title, this.todoList});

  travel_check.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    title = json['title'];
    todoList = json['todo_list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['title'] = this.title;
    data['todo_list'] = this.todoList;
    return data;
  }
}
