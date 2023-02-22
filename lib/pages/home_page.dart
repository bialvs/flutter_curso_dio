import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_1/pages/dados_cadastrais.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Meu App'),),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell (
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Dados cadastrais')),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DadosCadastraisPage()));
                  },
                ),
                Divider(),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Configurações')),
                  onTap: () {},
                ),
                Divider(),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Termos de uso')),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          children: [
            Container(color: Colors.green,),
            Container(color: Colors.amber,),
            Container(color: Colors.purple,),
          ],
        ),
      ),
    );
  }
}