//import 'package:sqflite/sqflite.dart';
import 'package:nossa_lista_de_desenhos/components/cartoon.dart';
import 'package:nossa_lista_de_desenhos/data/database.dart';
import 'package:sqflite/sqflite.dart';

class CartoonDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_rating INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'cartoonTable';
  static const String _name = 'nome';
  static const String _rating = 'nota';
  static const String _image = 'imagem';

  save(Cartoon desenho) async {
    print('Salvando desenho: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(desenho.nome);
    Map<String, dynamic> cartoonMap = toMap(desenho);
    if (itemExists.isEmpty) {
      print('O Desenho não existia.');
      return await bancoDeDados.insert(_tablename, cartoonMap);
    } else {
      print('O Desenho já existia.');
      return await bancoDeDados.update(
        _tablename,
        cartoonMap,
        where: '$_name = ?',
        whereArgs: [desenho.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Cartoon desenho) {
    print('Convertendo Desenho em Map: ');
    final Map<String, dynamic> mapaDeDesenhos = Map();
    mapaDeDesenhos[_name] = desenho.nome;
    mapaDeDesenhos[_rating] = desenho.nota;
    mapaDeDesenhos[_image] = desenho.foto;
    print('Mapa de Desenhos: $mapaDeDesenhos');
    return mapaDeDesenhos;
  }

  Future<List<Cartoon>> findAll() async {
    print('Acessando o Banco de Dados(findAll): ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando os dados no banco de dados... Encontrado: $result');
    return toList(result);
  }

  List<Cartoon> toList(List<Map<String, dynamic>> mapaDeDesenhos) {
    print('Convertendo to List:');
    final List<Cartoon> desenhos = [];
    for (Map<String, dynamic> linha in mapaDeDesenhos) {
      final Cartoon desenho =
          Cartoon(linha[_name], linha[_image], linha[_rating]);
      desenhos.add(desenho);
    }
    print('Lista de Desenhos: $desenhos');
    return desenhos;
  }

  Future<List<Cartoon>> find(String nomeDoDesenho) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDoDesenho],
    );
    print('Desenho encontrado: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDoDesenho) async {
    print('Deletando o desenho: $nomeDoDesenho');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDoDesenho],
    );
  }
}
