
import 'package:nossa_lista_de_desenhos/data/cartoon_dao.dart';
import 'package:nossa_lista_de_desenhos/data/user_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  sqfliteFfiInit(); // Certifique-se de chamar isso antes de openDatabase
  databaseFactory = databaseFactoryFfi; // Configura a fábrica do banco de dados
  final String path = join(await getDatabasesPath(), 'cartoon.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(CartoonDao.tableSql);
  }, version: 1,);
}

Future<Database> getUserDatabase() async {
final String path = join(await getDatabasesPath(), 'user.db');
return openDatabase(path, onCreate: (db, version) {
db.execute(UserDao.tableSql);
}, version: 1);
}

