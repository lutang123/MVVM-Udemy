

class Comment {

  final String title; 
  final int commentId; 

  Comment({this.title, this.commentId}); 

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      title: json["text"], 
      commentId: json["id"]
    );
  }

}