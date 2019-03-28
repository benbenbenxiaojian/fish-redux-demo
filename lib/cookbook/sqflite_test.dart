import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dog {
  Dog({this.id, this.name, this.age});

  final int id;
  final String name;
  final int age;

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'age': age};

  @override
  String toString() => 'Dog{id: $id, name: $name, age: $age}';
}

void main() {
  dbOption();
}

Future<void> dbOption() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    version: 1,
    onCreate: (db, version) => db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY,name TEXT,age INTEGER)'),
  );

  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db.update('dogs', dog.toMap(), where: 'id=?', whereArgs: [dog.id]);
  }

  Future<void> deleteDog(Dog dog) async {
    final db = await database;
    await db.delete('dogs', where: 'id=?', whereArgs: [dog.id]);
  }

  Future<List<Dog>> dogs() async {
    final db = await database;
    final maps = await db.query('dogs');
    return List.generate(
        maps.length,
        (i) =>
            Dog(id: maps[i]['id'], name: maps[i]['name'], age: maps[i]['age']));
  }

  var fido = Dog(id: 0, name: 'Fido', age: 35);

  await insertDog(fido);

  print(await dogs());

  fido = Dog(id: fido.id, name: fido.name, age: fido.age + 7);

  await updateDog(fido);

  print(await dogs());

  await deleteDog(fido);

  print(await dogs());

  await database.then((db) {
    db.close();
  });
}
