import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'database.dart';

class Settings {
  static Future<void> setValue(String name, String value) async {
    final database = await Database.open();
    await database.insert(
      'settings',
      {
        'name': name,
        'value': value,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<String> getValue(String name) async {
    final database = await Database.open();
    final List<Map<String, dynamic>> values = await database.query(
      'settings',
      where: "name = ?",
      whereArgs: [name],
    );
    if (values.isEmpty) {
      return null;
    }
    return values[0]['value'];
  }
}
