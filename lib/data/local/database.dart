import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  // Init ffi loader if needed.
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
  await db.execute('''
  CREATE TABLE settings (id INTEGER PRIMARY KEY,
   name TEXT,
  value TEXT)
  ''');

  await db.execute('''
  CREATE TABLE schedule (id INTEGER PRIMARY KEY, 
  name TEXT, 
  sch_date INTEGER,
  sch_hour INTEGER,
   sch_minute INTEGER, 
   city_id INTEGER, 
   FOREIGN KEY(city_id) REFERENCES city(id))
  ''');

  await db.execute('''
  CREATE TABLE city (id INTEGER PRIMARY KEY, 
  name TEXT,
  code_city INTEGER
  )
  ''');

  // prints [{id: 1, title: Product 1}, {id: 2, title: Product 1}]
  await db.close();
}
