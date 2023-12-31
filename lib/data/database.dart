
import 'package:nossa_lista_de_desenhos/data/cartoon_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'cartoon.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(CartoonDao.tableSql);
  }, version: 1,);
}


