class PostCheck {
    int id;
    String title;
    String content;
    String userName;
    String imageUrl;
    bool userLike;
    int likeCount;
    int commentCount;
    List<Map<String, dynamic>> commentList;

    PostCheck({
      required this.id,
      required this.title,
      required this.content,
      required this.userName,
      required this.imageUrl,
      required this.userLike,
      required this.likeCount,
      required this.commentCount,
      required this.commentList,
    }
    );

    factory PostCheck.fromJson(Map<String, dynamic> json) {
      return PostCheck(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        userName: json['user']['name'],
        imageUrl: json['image_url'],
        userLike: json['user_like'],
        likeCount: json['like_count'],
        commentCount: json['comment_count'],
        commentList: List<Map<String, dynamic>>.from(json['comment_list']),
      );
    }
}