class Student {
  final int id;
  final String name;
  final int age;
  final String email;
  final String phone;

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.phone
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(id: map['id'],
        name: map['name'],
        age: map['age'],
        email: map['email'],
        phone: map['phone']);
  }

  Map<String, dynamic> toMap() {
    final map = {
      'name' : name,
      'age' : age,
      'email' : email,
      'phone' : phone,
    };
    if(id != 0) {
      map['id'] = id;
    }
    return map;
  }

}