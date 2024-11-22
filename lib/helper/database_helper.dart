// database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, 'app_database.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      // Create your table here
      db.execute('''
        CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT)
      ''');
    });
  }

  // Example function to insert data into the table
  Future<int> insertItem(Map<String, dynamic> row) async {
    var db = await database;
    return await db.insert('items', row);
  }

  // Example function to fetch data from the table
  Future<List<Map<String, dynamic>>> getItems() async {
    var db = await database;
    return await db.query('items');
  }
}
