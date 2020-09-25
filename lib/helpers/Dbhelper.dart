import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;


class DBHelper {

// Function to access the database
  static Future<sql.Database> database() async {
// get a path to the database
    final dbPath = await sql.getDatabasesPath();
// Try opening the db , if it dosent exist , create a new db with 
// the following specifications
    return sql.openDatabase(
      path.join(dbPath, 'classes.db'),
      onCreate: (db, version) async {
        db.execute(
          'CREATE TABLE classes(id TEXT,subject TEXT,teacher TEXT,icon TEXT,color TEXT,startTime TEXT,endTime TEXT,day TEXT)'
        );
      },
    );
  }

// A function to insert elements into the
// Created database if not done previously
  Future<void> createDB(String table,Map<String,Object> data)async{
    final db = await database();
    db.insert(table, data,conflictAlgorithm:sql.ConflictAlgorithm.replace);
  }

  


}
