import 'package:flutter/material.dart';
import 'package:petgo_telas/telas/TelaConsulta.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOJA OFFSHORE'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Text(
                'Menu Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Produtos'),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TelaConsulta()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Produtos'),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TelaConsulta()),
                );
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Text('Bem-vindo à Tela Principal!',
            style: TextStyle(color: Colors.blueGrey, fontSize: 20,)
        ),
      ),
    );
  }
}
