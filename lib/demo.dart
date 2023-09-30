import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String name;
  final String place;
  final int age;
  final int birthYear;

  Users({
    required this.name,
    required this.place,
    required this.age,
    required this.birthYear,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'place': place,
      'age': age,
      'birthYear': birthYear,
    };
  }

  static Users fromJson(Map<String, dynamic> json) {
    return Users(
      name: json['name'],
      place: json['place'],
      age: json['age'],
      birthYear: json['birthYear'],
    );
  }

  Future<void> addUser({
    required String name,
    required String place,
    required int age,
    required int birthYear,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc(name);
    final user = Users(
      name: name,
      place: place,
      age: age,
      birthYear: birthYear,
    );
    final json = user.toJson();
    await docUser.set(json);
  }

  Stream<List<Users>> getUsers() {
    return FirebaseFirestore.instance.collection('Users').snapshots().map(
          (snapshot) =>
              snapshot.docs.map((docs) => Users.fromJson(docs.data())).toList(),
        );
  }
}
