class Task {

  Task(this.name);

  String name;
  bool isDone = false;

  void toggle(){
    isDone = !isDone;
  }
}