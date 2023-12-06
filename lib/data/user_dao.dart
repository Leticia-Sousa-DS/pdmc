import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database.dart';

class UserDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$_name TEXT, '
      '$_email TEXT, '
      '$_password TEXT)';

  static const String _tablename = 'users';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _email = 'email';
  static const String _password = 'password';

  Future<int> save(Map<String, dynamic> user) async {
    final Database database = await getUserDatabase() ;
    return await database.insert(_tablename, user);
  }

  Future<List<Map<String, dynamic>>> findAll() async {
    final Database database = await getUserDatabase() ;
    return await database.query(_tablename);
  }

  Future<Map<String, dynamic>> find(String email) async {
    final Database database = await getUserDatabase() ;
    final List<Map<String, dynamic>> result = await database.query(
      _tablename,
      where: '$_email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty ? result.first : {};
  }

  Future<int> update(Map<String, dynamic> user) async {
    final Database database = await getUserDatabase() ;
    return await database.update(
      _tablename,
      user,
      where: '$_email = ?',
      whereArgs: [user[_email]],
    );
  }

  Future<int> delete(String email) async {
    final Database database = await getUserDatabase() ;
    return await database.delete(
      _tablename,
      where: '$_email = ?',
      whereArgs: [email],
    );
  }

  Map<String, dynamic> toMap(String name, String email, String password) {
    return {
      _name: name,
      _email: email,
      _password: password,
    };
  }
}
