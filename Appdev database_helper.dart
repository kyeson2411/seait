import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async{

    if(_database!=null){
      return _database!;
    }else{
      _database = await _initDb('mydb.db');
      return _database!;

    }
  }
  Future<Database> _initDb(String DbName)async{
    final DbDir = await getDatabasesPath();
    final path = join(DbDir,DbName);
    return await openDatabase(path,version: 1,onCreate: (Database db, int ver){
      db.execute(
          '''
     CREATE TABLE 'user'(
     'id' INTEGER PRIMARY KEY AUTOINCREMENT,
     'fullname' TEXT NOT NULL,
     'email' TEXT NOT NULL,
     'password' TEXT NTO NULL,
     )
     '''
      );

    });
  }

  Future<int> insertUser(Map<String,dynamic> user)async{
    Database db = await instance.database;
    return await db.insert('users',user);
  }

  Future<bool> emailExist(String email)async{
    Database db = await instance.database;
    List<Map<String,dynamic>> result = await db.query('users',where: 'email = ?');
    return result.isNotEmpty;
  }
}