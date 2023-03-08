class Post {
  String post_id;
  String uid;
  String title;
  String description;
  String anonymous;
  DateTime date;

  Post(
      {required this.post_id,
      required this.uid,
      required this.title,
      required this.description,
      required this.anonymous,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'post_id': post_id,
      'uid': uid,
      'title': title,
      'description': description,
      'anonymous': anonymous,
      'date': date,
    };
  }
}
