class Task {

  Task(this.name);

  String name;
  bool isDone = false;

  void toggle(){
    isDone = !isDone;
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['isDone'] = isDone;
    return data;
  }

}