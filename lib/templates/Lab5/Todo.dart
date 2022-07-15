class Todo {
  late int userId;
  late int id;
  late String title;
  late bool completed;


  Todo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    title = json['title'];
    completed = json['completed'];
    id = json['id'];
  }
}
