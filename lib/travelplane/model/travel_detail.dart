class traveldetail {
  List<Todo>? todo;

  traveldetail({this.todo});

  traveldetail.fromJson(Map<String, dynamic> json) {
    if (json['todo'] != null) {
      todo = <Todo>[];
      json['todo'].forEach((v) {
        todo!.add(new Todo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todo != null) {
      data['todo'] = this.todo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Todo {
  String? detailContent;

  Todo({this.detailContent});

  Todo.fromJson(Map<String, dynamic> json) {
    detailContent = json['detailContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detailContent'] = this.detailContent;
    return data;
  }
}
