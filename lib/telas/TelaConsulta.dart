import 'package:flutter/material.dart';
import 'package:petgo_telas/service/ConsultaService.dart';
import 'package:petgo_telas/model/Consulta.dart';


class TelaConsulta extends StatefulWidget {
  @override
  _TelaConsultaState createState() => _TelaConsultaState();
}

class _TelaConsultaState extends State<TelaConsulta> {
  late Future<List<Consulta>> _consultas;
  final ConsultaService _consultaService = ConsultaService();

  //final TextEditingController _dataController = TextEditingController();
  //final TextEditingController _descricaoController = TextEditingController();

  //Consulta? _consultaAtual;

  // @override
  // void initState() {
  //  super.initState();
  // _atualizarProdutos();}

  //void _atualizarProdutos() {
  //setState(() {
  // _produtos = _produtoService.buscarProdutos();
  // });}

  //void _mostrarFormulario({Consulta? consulta}) {
  //if (consulta != null) {
  // _consultaAtual = consulta;
  // _dataController.text = consulta.data;
  //_precoController.text = produto.preco;
  //} else {
  //  _produtoAtual = null;
  // _nomeController.clear();
  // _precoController.clear();}

  //showModalBottomSheet(
  //context: context,
  //isScrollControlled: true,
  // builder: (context) => Padding(
  //  padding: EdgeInsets.only(
  //    bottom: MediaQuery.of(context).viewInsets.bottom,
  //    top: 20,
  //    left: 20,
  //   right: 20,
  //  ),
  //child: Column(
  // mainAxisSize: MainAxisSize.min,
  //  children: [
  //    TextField(
  //     controller: _nomeController,
  //      decoration: InputDecoration(labelText: 'Nome'),
  //  );
  //    TextField(
  //      controller: _precoController,
  //     decoration: InputDecoration(labelText: 'Preço'),
  //      keyboardType: TextInputType.number,
  //    ),
  //    SizedBox(height: 20),
  //    ElevatedButton(
  //      onPressed: _submeter,
  //     child: Text(_produtoAtual == null ? 'Criar' : 'Atualizar'),
  //   ),
  //  ],
  // ),
  //    ),
  // );
  // }

//  void _submeter() async {
//    final nome = _nomeController.text;
//    final preco = _precoController.text;

//    if (_produtoAtual == null) {
//      final novoProduto = Produto(nome: nome, preco: preco);
//      await _produtoService.criarProduto(novoProduto);
  //   }
  //   else {
  //     final produtoAtualizado = Produto(
  //       id: _produtoAtual!.id,
  //       nome: nome,
  //       preco: preco,
  //     );
  //     await _produtoService.atualizarProduto(produtoAtualizado);
  //   }

  //  Navigator.of(context).pop();
  //  _atualizarProdutos();
  // }

  //void _deletarProduto(int id) async {
  // try {
  //  await _produtoService.deletarProduto(id);
  //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Produto deletado com sucesso!')));
  //  _atualizarProdutos();
  // } catch (error) {
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Falha ao deletar produto: $error')));
  // } }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONSULTA'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => (),
          ),
        ],
      ),
      body: FutureBuilder<List<Consulta>>(
        future: _consultas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final consulta = snapshot.data![index];
                return ListTile(
                  title: Text(consulta.descricao),
                  subtitle: Text(consulta.data),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => (),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => (),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

