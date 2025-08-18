import 'dart:ffi';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  static Database? _db;
  static final DatabaseServices instance = DatabaseServices._contructor();
  final String _memoTableName = "memo";
  final String _memoColumnId = "id";
  final String _memoColumnPoints = "points";
  final String _memoColumntime = "time";
  final String _memoColumnGeneratedPairs = "generated_pairs";
  final String _memoColumnWrittenPairs = "written_pairs";
  final String _memoColumnDate = "date";

  DatabaseServices._contructor();

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    // optenemos la ruta donde se guarda la base de datos
    final databaseDIrPath = await getDatabasesPath();
    // le agregamos el nombre de la base de datos a la ruta
    final databasePath = join(databaseDIrPath, "memory_db.db");

    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $_memoTableName (
          $_memoColumnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $_memoColumnPoints INTEGER NOT NULL DEFAULT 0,
          $_memoColumntime REAL NOT NULL, 
          $_memoColumnGeneratedPairs TEXT NOT NULL,
          $_memoColumnWrittenPairs TEXT NOT NULL,
          $_memoColumnDate TEXT NOT NULL
        );
        ''');
      },
    );
    return database;
  }

  void addMemo(
    int ponits,
    String Wpairs,
    String Gpairs,
    Float time,
    String date,
  ) async {
    final db = await database;
    await db.insert(
      _memoTableName,
      {
        _memoColumnPoints: ponits,
        _memoColumnWrittenPairs: Wpairs,
        _memoColumnGeneratedPairs: Gpairs,
        _memoColumntime: time,
        _memoColumnDate: date
      }
    );
  }
}
