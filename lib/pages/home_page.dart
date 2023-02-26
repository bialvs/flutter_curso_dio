import 'package:flutter/material.dart';
import 'package:login_1/pages/card_page.dart';
import '../shared/widgets/custom_drawer.dart';

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
        drawer: CustomDrawer(),
        body: PageView(
          children: [
            CardPage(),
            Container(color: Colors.amber,),
            Container(color: Colors.purple,),
          ],
        ),
      ),
    );
  }
}