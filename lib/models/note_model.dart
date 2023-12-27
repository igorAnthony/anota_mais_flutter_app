//preciso de um modelo para uma classe chamada Anotacao
class Note {
  Note({
    required this.id,
    required this.title,
    required this.description,
  });
  int id;
  String title;
  String description;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        title: json["titulo"],
        description: json["descricao"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": title,
        "descricao": description,
      };
}
