import 'package:flutter/material.dart';
import 'package:nossa_lista_de_desenhos/components/cartoon.dart';
import 'package:nossa_lista_de_desenhos/data/cartoon_dao.dart';
//import 'package:nossa_lista_de_desenhos/data/cartoon_inherited.dart';
//import 'package:sqflite_common/sqlite_api.dart';


//import '../components/cartoon.dart';
import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Cartoon List'),
        backgroundColor: Colors.red,
        leading: Container(),
        actions: [
          IconButton(onPressed: () => _reloadScreen(), icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Cartoon>>(
          future: CartoonDao().findAll(),
          builder: (context, snapshot) {
            try {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Cartoon desenho = snapshot.data![index];
                      return desenho;
                    },
                  );
                } else {
                  return _buildNoCartoonWidget();
                }
              } else if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.active) {
                return _buildLoadingWidget();
              } else {
                return _buildErrorWidget('Erro ao carregar Desenhos: ${snapshot.error}');
              }
            } catch (error) {
              return _buildErrorWidget('Erro desconhecido: $error');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                cartoonContext: context,
              ),
            ),
          ).then((value) => _reloadScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildNoCartoonWidget() {
    return Center(
      child: Column(
        children: const [
          Icon(Icons.error_outline, size: 128),
          Text(
            'Não há nenhum Desenho',
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        children: const [
          CircularProgressIndicator(),
          Text('Carregando'),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String errorMessage) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 128),
          Text(
            errorMessage,
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }

  void _reloadScreen() {
    setState(() {
      print('Recarregando a tela inicial');
    });
  }
}
