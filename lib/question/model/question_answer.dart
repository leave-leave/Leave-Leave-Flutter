class answer {
  List<Answers>? answers;

  answer({this.answers});

  answer.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? questionId;
  bool? questionAnswer;

  Answers({this.questionId, this.questionAnswer});

  Answers.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    questionAnswer = json['questionAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['questionAnswer'] = this.questionAnswer;
    return data;
  }
}
