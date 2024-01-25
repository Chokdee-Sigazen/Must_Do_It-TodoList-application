// ignore_for_file: file_names

class ToDoList {
  // ignore: non_constant_identifier_names
  int No;
  String Name;
  String date1;
  String date2;
  String detail;
  bool done = false;
  ToDoList(this.Name, this.date1, this.date2, this.detail, this.No);

  void click() {
    done = !done;
  }
}
