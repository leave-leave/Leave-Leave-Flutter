class PostCheck {
  int? id;
  String? title;
  String? content;
  User? user;
  bool? userLike;
  int? likeCount;
  int? commentCount;
  List<dynamic>? commentList;

  PostCheck({
    this.id,
    this.title,
    this.content,
    this.user,
    this.userLike,
    this.likeCount,
    this.commentCount,
    this.commentList,
  });

  PostCheck.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    userLike = json['userLike'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    commentList = json['commentList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['userLike'] = this.userLike;
    data['likeCount'] = this.likeCount;
    data['commentCount'] = this.commentCount;
    data['commentList'] = this.commentList; // 수정된 부분
    return data;
  }
}

class User {
  String? name;

  User({this.name});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
