import 'dart:convert';

class Todo {
  final String id;
  final String text;
  final String description;

  Todo({
    required this.id,
    required this.text,
    required this.description,
});

  Map<String,dynamic> toMap (){
    return <String,dynamic> {
      'id' : id,
      'text': text,
      'description':description
    };
  }

  factory Todo.fromMap(Map<String,dynamic> map){
    return Todo(
        id: map['id'] as String,
        text: map['text'] as String,
        description: map['description'] as String
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String,dynamic>);
}