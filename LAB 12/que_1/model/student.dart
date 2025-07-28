class Student {
  final String name;
  final int age;
  final String email;
  final String? id;

  Student({
    required this.name,
    required this.age,
    required this.email,
    this.id,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    name: json['name'] ?? '',
    age: int.tryParse(json['age'].toString()) ?? 0,
    email: json['email'] ?? '',
    id: json['id'],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "email": email,
  };
}
