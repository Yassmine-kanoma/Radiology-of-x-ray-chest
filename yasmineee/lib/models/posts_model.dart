class PostsModel {
  final String uid;
  final String name;
  final String phone;
  final String content;

  const PostsModel(
      {required this.uid,
      required this.name,
      required this.phone,
      required this.content});

  factory PostsModel.formJson(Map<String, dynamic> json) => PostsModel(
        uid: json['uid'],
        name: json['name'],
        phone: json['phone'],
        content: json['content'],
      );

  Map<String,dynamic> toJson()=>{
    uid:'uid',
    content:'content',
    phone:'phone',
    name:'name',
  };
}
