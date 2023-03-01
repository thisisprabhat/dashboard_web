class ToDoApiModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  ToDoApiModel({this.userId, this.id, this.title, this.completed});

  ToDoApiModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
}
