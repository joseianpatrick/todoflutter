class Todo{
   String title;
   String description;
   bool checked = false;

  Todo({this.title,this.description,this.checked});
  Todo.defConst({this.title,this.description});
}