
class Todo{
    String title;
    String description;
    bool checked;
    int id;

    //initiate checked as false for checkbox
    Todo({this.title,this.description,this.id,this.checked = false});

    factory Todo.fromMap(Map<String, dynamic> json) { 
      return Todo( 
         id: json['id'], 
         title: json['title'], 
         description: json['description'], 
      );
   }
}