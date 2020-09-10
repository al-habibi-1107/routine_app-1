import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';


class DBHelper {
  static Future<Database> database() async {
    final dbpath = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dbpath, 'classes.db'),
        onCreate: (db, version) {
         // db.execute('CREATE TABLE classes()')
        });
  }
}
